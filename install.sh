#!/usr/bin/env bash


software_list=(
    openssh # 基本的ssh连接，后面有[ 服务 ]

    # 压缩工具
    unzip
    zip

    # 下载工具
    wget
    curl

    # 编辑工具
    neovim

    alacritty # 一个不错的终端
    gtk4 # alacritty的图形界面

    fish # 一个好用的shell

    hyprland # 一个好用的桌面环境


    lxqt-policykit # 图形界面授权管理

    # 字体和图标
    ttf-maple
    nerd-fonts-sarasa-term
    ttf-apple-emoji
    papirus-icon-theme


    libnotify # 手动发送通知

    aylurs-gtk-shell # 比较集成的状态栏

    open-vm-tools # 虚拟机必备，后面有[ 服务 ]

    # sddm # 后面有[ 服务 ]启动

    # wayvnc # 远程连接必备

    # python-numpy # novnc的强化

    # clash-verge-rev-bin # hack: 网络工具，可能会有变化...
)


pacman_packages_install_paru() {
    if sudo pacman -Q $1 | grep $1; then
        echo -e "$COK - $1 is installed"
    else
        echo -e "$CNT - $1 is not installed, now installing"
        if [[ $1 == "paru" ]]; then
            read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install the paru? (Y,n) ' INST
            if [[ $INST != "N" && $INST != "n" ]]; then
                echo -e "Installing paru"
                sudo pacman -S --noconfirm --needed base-devel;
                git clone https://aur.archlinux.org/paru.git
                cd paru
                makepkg -si --noconfirm
                cd ..
                sudo rm -rf paru
            else
                exit
            fi
        fi
    fi
}

paru_packages_install() {
    ((counter++))
    if sudo paru -Q $1 | grep $1; then
        echo -e "$COK - $counter of $total - $1 is installed"
    else
        echo -e "$CNT - $counter of $total - $1 is not installed, now installing"
        paru -S --noconfirm $1

        if sudo paru -Q $1 | grep $1; then
            echo -e "$COK - $counter of $total - $1 is installed"
        else
            echo -e "$CER - $counter of $total - $1 install had failed"
            exit
        fi
    fi
}

# set some colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
INSTLOG="install.log"


# start script
pacman_packages_install_paru paru

total=${#software_list[@]}
counter=0

read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install the packages? (Y,n) ' INST
if [[ $INST != "N" && $INST != "n" ]]; then


    echo -e "$CNT - Prep Stage - Installing needed components, this may take a while..."
    for SOFTWR in ${software_list[@]}; do
        paru_packages_install $SOFTWR 
    done
else
    exit
fi


read -rep $'[\e[1;33mACTION\e[0m] - Would you like to copy config files? (Y,n) ' CFG
if [[ $HYP != "N" && $HYP != "n" ]]; then
    echo -e "$CNT - Copying config files..."
    ./restore_to_config.sh
    echo -e "$CNT - Setting up git config..."
    git config --global user.email "czy797@outlook.com"
    git config --global user.name "CnsMaple"
else
    exit
fi


read -rep $'[\e[1;33mACTION\e[0m] - Would you like to enable the services now? (Y,n) ' HYP
if [[ $HYP != "N" && $HYP != "n" ]]; then
    echo -e "$CNT - Enabling Services..."
    echo -e "$CNT - Enabling sshd..."
    sudo systemctl enable sshd

    # echo -e "$CNT - Enabling fish_udp_server_linux..."
    # sudo ln -s /home/maple/dotfiles-hyprland/fish_udp_server_linux.service  /etc/systemd/system/fish_udp_server_linux.service
    # sudo systemctl enable fish_udp_server_linux.service

    # echo -e "$CNT - Enabling sddm..."
    # sudo ln -s /home/maple/dotfiles-hyprland/sddm.conf  /etc/sddm.conf
    # sudo systemctl enable sddm

    echo -e "$CNT - Enabling vmware services..."
    sudo systemctl enable vmtoolsd
    sudo systemctl enable vmware-vmblock-fuse
else
    exit
fi

read -rep $'[\e[1;33mACTION\e[0m] - you need to reboot, would you like to reboot now? (Y,n) ' HYP
if [[ $HYP != "N" && $HYP != "n" ]]; then
    echo -e "$CNT - Rebooting..."
    echo -e "$CNT - Script had completed!"
    sudo reboot
else
    exit
fi
