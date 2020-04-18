# dotfiles
`Manjaro` + `i3Wm` + `Urxvt` + `Polybar` + `Rofi` + `Picom` + `Dunst` + `Fcitx`

## 安装
1. 下载[manjaor i3wm](https://manjaro.org/download/#i3)
2. 使用`Rufus`制作安装盘
3. 根据提示安装后重启
4. 打开终端`$mod`+`Enter`,(`$mod`默认为`win`键)
5. 下载dotfiles代码,`git clone https://github.com/kimloong/dotfiles.git`
6. 安装基本使用及自定义环境,`bash ~/dotfiles/installation/install_all.sh`
7. 安装后端开发环境,`bash ~/dotfiles/installation/backend_develop.sh`
8. 安装其它文档及音频软件,`bash ~/dotfiles/installation/options.sh`


# 附录
## pacman
```
# 列出已经安装的软件包
pacman -Q

# 查看virtualbox包是否已经安装
pacman -Q virtualbox

# 查看已安装的包virtualbox的详细信息
pacman -Qi virtualbox

# 列出已安装包virtualbox的所有文件
pacman -Ql virtualbox

# 查找某个文件属于哪个包
pacman -Qo /etc/passwd