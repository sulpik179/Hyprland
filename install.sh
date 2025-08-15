#!/bin/bash

#  UPDATE SYS  #
sudo pacman -Syu

#  YAY  #
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

 #  YAY APPS  #
yay -S visual-studio-code-bin  #  vs code
yay -S telegram-desktop-bin  #  telegram

#  IWGTK  #
sudo pacman -S iwd
sudo systemctl enable --now iwd.service
systemctl status iwd.service
yay -S iwgtk
iwgtk

#  APPS INSTALL  #
sudo pacman -S neovim nautilus swww obsidian hyprpicker swayimg power-profiles-daemon wlsunset waybar



#  RESTART_WAYBAR.SH  #
mkdir -p ~/.config/scripts
cat > ~/.config/scripts/restart_waybar.sh << 'EOF'
#!/bin/fish
killall waybar
sleep 0.1
waybar &
EOF
chmod +x ~/.config/scripts/restart_waybar.sh
echo "Скрипт restart_waybar.sh создан и готов к использованию."


#  FISH SHELL  #
sudo pacman -S --noconfirm inetutils
mkdir -p ~/.config/fish
cat > ~/.config/fish/config.fish << 'EOF'
function fish_prompt
  if status is-interactive
      set_color 2de3c8     # цвет имени пользователя 
      echo -n (whoami)
      set_color normal
      echo -n '@'
      set_color white      # цвет хоста
      echo -n (hostname -s)
      set_color normal
      echo -n ' \~> '
  end
end
EOF
echo "inetutils установлен и fish_prompt настроен."

#  KITTY Terminal  #
sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
mkdir -p ~/.config/kitty
cat > ~/.config/kitty/kitty.conf << 'EOF'
    #  _    _ _   _           _                      _             _  
    # | | _(_) |_| |_ _   _  | |_ ___ _ __ _ __ ___ (_)_ __   __ _| | 
    # | |/ / | __| __| | | | | __/ _ \ '__| '_ ` _ \| | '_ \ / _` | | 
    # |   <| | |_| |_| |_| | | ||  __/ |  | | | | | | | | | | (_| | | 
    # |_|\_\_|\__|\__|\__, |  \__\___|_|  |_| |_| |_|_|_| |_|\__,_|_| 
    #                 |___/              _          _   _             
    #   ___ _   _ ___| |_ ___  _ __ ___ (_)______ _| |_(_) ___  _ __  
    #  / __| | | / __| __/ _ \| '_ ` _ \| |_  / _` | __| |/ _ \| '_ \ 
    # | (__| |_| \__ \ || (_) | | | | | | |/ / (_| | |_| | (_) | | | |
    #  \___|\__,_|___/\__\___/|_| |_| |_|_/___\__,_|\__|_|\___/|_| |_|
    
    ##########################################################################
    # font
font_family JetBrainsMono Nerd Font
enable_ligatures yes
# opacity and blur 
background_opacity 0.85
background_blur 0.9
# window layout
remember_window_size  no
initial_window_width  1200
initial_window_height 750
window_border_width 1.5pt
enabled_layouts tall
window_padding_width 0
window_margin_width 2
hide_window_decorations no
# tab bar customization
tab_bar_style powerline
tab_powerline_style slanted
tab_bar_edge bottom
tab_bar_align left
active_tab_font_style   bold
inactive_tab_font_style normal
EOF
echo "Шрифт и конфигурация Kitty созданы."


