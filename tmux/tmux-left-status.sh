#!/usr/bin/env bash

get_vpn () {
    local network_name=$( /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --getinfo | grep -E '\bSSID:' | cut -d: -f2- | sed -E -e 's/^ (.+)/\1/' )

    local vpns=("utun" "ppp" "ipsec")

    check_vpn () {
        for vpn in "${vpns[@]}"; do
            if netstat -nr -f inet | grep "$vpn" > /dev/null; then
                echo "$vpn"
            fi
        done
    }

    if [[ $(check_vpn) ]]; then
        echo "VPN: #[bg=colour70,fg=colour255]  #[default]"
    elif [[ $network_name == "wpa2" ]]; then
        echo "#[bg=colour75,fg=colour0]  #[default]"
    else
        echo "VPN: #[bg=colour214,fg=colour240]  #[default]"
    fi
}

left_status() {
    local separator=" #[fg=white,bright]| "
    local session="#{?client_prefix,#[fg=red][#S] 🐉 ,#[fg=white,bright][#S] }#{?window_zoomed_flag,🔍 ,}" 
    local vpn=$(get_vpn)
    local host="#[fg=cyan,bold]#H"
    echo "$session$host$separator$vpn$separator"
}

left_status
