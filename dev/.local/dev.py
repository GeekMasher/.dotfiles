#!/usr/bin/env python3
import os
import json
import logging
import subprocess
from typing import Dict
import argparse

from simple_term_menu import TerminalMenu


parser = argparse.ArgumentParser("DevMi")
parser.add_argument("--debug", action="store_true")

parser.add_argument("-m", "--mode")
parser.add_argument("-n", "--name")
parser.add_argument("--dev", default=".dev.json")
parser.add_argument("--path", default=os.environ.get("DEV_FOLDER"))

parser.add_argument("--tmux", action="store_true")


def encode_name(name: str):
    vars = [(" ", "-"), ("/", ""), (".", "-")]
    for v, r in vars:
        name = name.replace(v, r)
    return name.lower()


def add(dev: Dict, root: str = "", **kargs):
    name = input("Project Name: ")
    dev_name = encode_name(name)
    dev[dev_name] = {
        "name": name,
        "path": os.getcwd()
    }
    return dev


def list_projects(dev: Dict, root: str = "./", **kargs):
    items = []
    for _, proj in dev.items():
        items.append(f"{proj.get('name')}")

    terminal_menu = TerminalMenu(items, title="Projects")
    menu_entry_index = terminal_menu.show() 
    if not menu_entry_index:
        return dev

    selected = items[menu_entry_index]
 
    for project_name, project in dev.items():
        if project.get("name") is not selected:
            continue

        if project.get("projects"):
            return list_projects(project.get("projects"), root=root, **kargs)

        path = project.get("path")
        if not os.path.exists(path):
            raise Exception(f"Unknown path :: {path}")

        logging.debug(f"Loading :: {project_name}")

        build_path = os.path.join(path, ".build.json")
        dev[project_name]["build"] = os.path.exists(build_path)

        logging.debug(f"Running Tmux :: {project_name}")
        # Jump into Tmux
        subprocess.run(
            ["tmux", "new", "-s", project_name],
            cwd=path
        )
        break

    return dev


if __name__ == "__main__":
    arguments = parser.parse_args()
    
    logging.basicConfig(
        level=logging.DEBUG if arguments.debug else logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    )

    logging.debug(f"Debug mode enabled")
    logging.debug(f"Tmux Enabled :: {arguments.tmux}")

    path = os.path.join(arguments.path, arguments.dev)

    # TODO checks
    with open(path, "r") as handle:
        dev = json.load(handle)
    
    modes = [
        ("add", add),
        ("list", list_projects)
    ]     

    mode = arguments.mode
    
    if not mode:
        terminal_menu = TerminalMenu(modes, title="Mode")
        menu_entry_index = terminal_menu.show() 
        if not menu_entry_index:
            exit(1)
        mode = modes[menu_entry_index] 
    else:
        if mode not in [m[0] for m in modes]:
            raise Exception(f"Unknown mode :: {mode}")

    for mode_option, mode_call in modes:
        if mode == mode_option:
            mode_call(
                dev,
                root=arguments.path,
                tmux=arguments.tmux
            )
            continue

    with open(path, "w") as handle:
        json.dump(dev, handle, indent=2, sort_keys=True)


