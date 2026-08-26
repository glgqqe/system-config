cd ~/system-config || { echo "Ошибка: Директория ~/system-config не найдена"; exit 1; }
cp -r ~/.config/home-manager/ ~/system-config/.config/
sudo cp -r /etc/nixos/ ~/system-config/etc/
git add .
git commit -m "update configuration"
git push
