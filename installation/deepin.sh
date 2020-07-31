yay -S deepin deepin-extra xorg xorg-xserver
sudo sed -i '/^#greeter-session/a\greeter-session=lightdm-deepin-greeter' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm