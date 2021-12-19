import os
import json
import logging
import argparse
import subprocess


__HERE__ = os.path.abspath(os.path.dirname(__file__))
languages_path = os.path.join(__HERE__, "geek-code.json")


parser = argparse.ArgumentParser("GeekCode")
parser.add_argument("--debug", action="store_true")
parser.add_argument("-l", "--languages", dest="languages", default=languages_path)

parser.add_argument("-m", "--main", "--run", dest="main", action="store_true")
parser.add_argument("-f", "--format", dest="format", action="store_true")
parser.add_argument("-t", "--test", "--testing", dest="test", action="store_true")


def error(msg: str):
    print(f"[!] Error :: {msg}")
    return False


def runBuild(langdata: dict, lang: str, **options):
    """Find andf Run Build commands"""
    build_types = ["format", "test", "main"]

    for btype in build_types:
        logging.debug(f" > Build Type: {btype} == {options.get(btype, False)}")
        if options.get(btype, False) and langdata.get(btype):
            logging.debug(f"Running {btype}: {lang}")

            if isinstance(langdata.get(btype), str):
                runCommand(langdata.get(btype, None))
            else:
                runCommand(
                    langdata.get(btype, {}).get(options.get("detection", None), None)
                )

        elif options.get(btype, False) and not langdata.get(btype):
            logging.debug(f"Option set but no build setup")


def runCommand(cmd: str) -> bool:
    """Run subprocess command"""
    if not cmd:
        return error("Command not found")
    logging.debug(f"Running command :: `{cmd}`")
    subprocess.run(cmd, cwd=os.getcwd(), shell=True)

    return True


if __name__ == "__main__":
    arguments = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if arguments.debug else logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    )

    if not os.path.exists(arguments.languages):
        raise Exception("Unable to load languages settings")

    # if a custom build command file is present, run it
    build_path = os.path.join(os.getcwd(), ".build.json")
    if os.path.exists(build_path):
        logging.debug(f"Build file present: {build_path}")

        with open(build_path, "r") as handle:
            build_config = json.load(handle)

        runBuild(
            build_config,
            build_config.get("language"),
            main=arguments.main,
            test=arguments.test,
            format=arguments.format,
        )

        exit(0)

    logging.debug(f"Loading languages config: {arguments.languages}")
    with open(arguments.languages, "r") as handle:
        languages = json.load(handle)

    for lang, langdata in languages.items():
        logging.debug(f"Checking language :: {lang}")

        detection = None
        for dct in langdata.get("detection", []):
            if not os.path.exists(dct):
                continue
            logging.debug(f"Found detection: {dct}")
            detection = dct

        if not detection:
            logging.debug(f"No detections triggered...")
            continue

        runBuild(
            langdata,
            lang,
            main=arguments.main,
            test=arguments.test,
            format=arguments.format,
            detection=detection,
        )
