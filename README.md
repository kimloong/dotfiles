# dotfiles
`Manjaro` + `Deepin`

## 安装
1. 下载[manjaor i3wm](https://manjaro.org/download/#i3)
2. 使用`Rufus`制作安装盘
3. 根据提示安装后重启
4. 打开终端`$mod`+`Enter`,(`$mod`默认为`win`键)
5. 下载dotfiles代码,`git clone https://github.com/kimloong/dotfiles.git`
6. 安装基本使用及自定义环境,`bash ~/dotfiles/installation/install_all.sh`
7. 安装后端开发环境,`bash ~/dotfiles/installation/backend_develop.sh`
8. 安装其它文档及音频软件,`bash ~/dotfiles/installation/options.sh`

## 浏览器科学上网
### [下载](https://www.switchyomega.com/download.html) 安装chrome插件`switchyomega`
### 配置`switchyomega`
#### 新建情景模式
代理协议选择:`SOCKS5`
代理服务器:127.0.0.1
代理端口:1080
#### 至自动规则页面
`规则列表规则`引用上面创建的情景
`默认情景模式`选择`直接连接`
`规则列表格式`选择`AutoProxy`
`规则列表网址`填入
```
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```
## chrome上的`switchyomega`插件场景模式选择`自动切换`

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