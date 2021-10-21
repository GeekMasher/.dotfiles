#!/bin/bash


function android() {
    function _android_prompt_info() {
        export _device_info=$(adb devices -l | tail +2)
        export device_id=$(echo "$_device_info" | awk -F " " '{ print $1 }')
        # TODO: refactor
        device_name=$(echo "$_device_info" | awk -F " " '{ print $6 }' | awk -F ":" '{ print $2 }')
        device_version=$(echo "$_device_info" | awk -F " " '{ print $4 }' | awk -F ":" '{ print $2 }')

        if [[ $device_name = "" ]]; then
            echo "[ %{%F{blue}%}android%{%B%F{green}%} :: %{%F{red}%}No Device Present%{%B%F{green}%} ]"
        else
            echo "[ %{%F{blue}%}android%{%B%F{green}%} :: %{%F{magenta}%}$device_name - $device_version%{%B%F{green}%} ]"
        fi
    }

    PROMPT='
%{%K{${bkg}}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%} $(_android_prompt_info)%E%{%f%k%b%}
%{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%} %#%{%f%k%b%} '

    function check() {
        if [[ $(adb devices -l | tail +2) = "" ]]; then
            echo "[-] Is the Android device connected??"
            return 1s
        fi
        return 0
    }

    function info() {
        if ! check; then
            return
        fi
        # TODO: refactor
        echo "Product Name      :: $(adb -s $device_id shell getprop ro.product.model)"
        echo "Device Name       :: $(adb -s $device_id shell getprop ro.product.device)"
        echo "Android Version   :: $(adb -s $device_id shell getprop ro.build.version.release)"
        echo "Android SDK       :: $(adb -s $device_id shell getprop ro.build.version.sdk)"
        echo "Fingerprint       :: $(adb -s $device_id shell getprop ro.build.fingerprint)"
    }

    function logs() {
        if ! check; then
            return
        fi
        adb -s $device_id logcat
    }

    function shell() {
        if ! check; then
            return
        fi
        # padding
        echo ""
        adb -s $device_id shell
    }

    function tools() {
        if ! check; then
            return
        fi
        echo "[+] Loading tools..."
    }
}

