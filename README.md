# 使用前提

1. 请阅读一遍我的脚本先。
2. 我的所有配置都是基于`maple`用户的，而且是独属于我的 Linux 全恢复的。

# 使用

> 克隆的时候不要起别名，也不要放在其他位置，就放在家目录下，并且就叫`dotfiles-hyprland`

1. 克隆：git clone --recurse-submodules https://github.com/CnsMaple/dotfiles-hyprland.git
   > 如果忘记加`--recurse-submodules`那就再执行：git submodule update --init --recursive
2. 使用`./install.sh`来安装。
3. （install.sh 脚本会自动运行，这里是只手动执行恢复，可能用于误删`.config`的文件）运行`./restore_to_config.sh`来恢复配置。
4. 更新当前的 config 的文件：`./update_config_to_here.sh`。
