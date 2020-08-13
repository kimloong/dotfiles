yay -S --noconfirm --needed deepin deepin-extra xorg xorg-xserver networkmanager
if [ $(grep -c -e "deepin" /etc/lightdm/lightdm.conf) -eq '0' ]; then
  sudo sed -i '/^#greeter-session/a\greeter-session=lightdm-deepin-greeter' /etc/lightdm/lightdm.conf
fi
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager.service