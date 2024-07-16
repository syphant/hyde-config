#!/usr/bin/zsh

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NOCOLOR='\033[0m'

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

alias un='$aurhelper -Rns' # uninstall package

# Uninstall unneeded packages
echo -e "${BLUE}Uninstalling unneeded packages...${NOCOLOR}"
echo "..."
sleep 1
un code vim
echo "..."
echo -e "${GREEN}Unneeded packages uninstalled!${NOCOLOR}"
echo "..."
sleep 1

# Install needed packages
echo -e "${BLUE}Installing needed packages...${NOCOLOR}"
echo "..."
sleep 1
pacman -S --noconfirm bat flatpak font-manager ttf-roboto-mono-nerd inter-font gnome-keyring intel-media-driver neovim obs-studio distrobox podman unzip
yay -S --noconfirm cava oh-my-posh protonvpn spotify tmatrix genact brave-bin vscodium spicetify-cli jellyfin-media-player
echo "..."
echo -e "${GREEN}Needed packages installed!${NOCOLOR}"
echo "..."
sleep 1

# Install flatpak packages
echo -e "${BLUE}Installing flatpaks...${NOCOLOR}"
echo "..."
sleep 1
flatpak install -y com.discordapp.Discord
flatpak install -y com.parsecgaming.parsec
flatpak install -y com.moonlight_stream.Moonlight
echo "..."
echo -e "${GREEN}Flatpaks installed!${NOCOLOR}"
echo "..."
sleep 1

# Apply Oh My Posh config
echo -e "${BLUE}Applying Oh My Posh config...${NOCOLOR}"
echo "..."
sleep 1
mkdir ~/.config/ohmyposh
\cp -f ./ohmyposh/config.json ~/.config/ohmyposh/config.json
echo "..."
echo -e "${GREEN}Oh My Posh config applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply ZSH config
echo -e "${BLUE}Applying ZSH config...${NOCOLOR}"
echo "..."
sleep 1
\cp -f .zshrc ~/.zshrc
echo "..."
echo -e "${GREEN}ZSH config applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply CAVA config
echo -e "${BLUE}Applying CAVA config...${NOCOLOR}"
echo "..."
sleep 1
mkdir ~/.config/cava
\cp -f ./cava/config ~/.config/cava/config
echo "..."
echo -e "${GREEN}CAVA config applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply dunst config
echo -e "${BLUE}Applying dunst config...${NOCOLOR}"
echo "..."
sleep 1
\cp -f ./dunst/* ~/.config/dunst/
echo "..."
echo -e "${GREEN}dunst config applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply changes to Catppuccin Mocha HyDE theme
echo -e "${BLUE}Applying changes to Catppuccin Mocha HyDE theme...${NOCOLOR}"
echo "..."
sleep 1
rm -rf ~/.config/hyde/themes/Catppuccin\ Mocha/wallpapers/*
\cp -rf ./hyde/themes/Catppuccin\ Mocha/* ~/.config/hyde/themes/Catppuccin\ Mocha/
echo "..."
echo -e "${GREEN}Catppuccin Mocha HyDE theme changes applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply Kitty config
echo -e "${BLUE}Applying Kitty config...${NOCOLOR}"
echo "..."
sleep 1
\cp -f ./kitty/kitty.conf ~/.config/kitty/kitty.conf
echo "..."
echo -e "${GREEN}Kitty config applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply Fastfetch config
echo -e "${BLUE}Applying Fastfetch config...${NOCOLOR}"
echo "..."
sleep 1
\rm -rf ~/.config/fastfetch/*
\cp -rf ./fastfetch/* ~/.config/fastfetch/
echo "..."
echo -e "${GREEN}Fastfetch config applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply Hyprland userprefs
echo -e "${BLUE}Applying Hyprland userprefs...${NOCOLOR}"
echo "..."
sleep 1
\cp -f ./hypr/userprefs.conf ~/.config/hypr/userprefs.conf
echo "..."
echo -e "${GREEN}Hyprland userprefs applied!${NOCOLOR}"
echo "..."
sleep 1

# Install NvChad
echo -e "${BLUE}Installing NvChad...${NOCOLOR}"
echo "..."
sleep 1
git clone https://github.com/NvChad/starter ~/.config/nvim
echo "..."
echo -e "${GREEN}Installed NvChad! ${RED}YOU WILL NEED to enter nvim and then run ${CYAN}:MasonInstallAll ${RED}after lazy.nvim finishes downloading plugins!!!${NOCOLOR}"
echo "..."
sleep 1

# Apply NvChad transparency
echo -e "${BLUE}Applying NvChad transparency...${NOCOLOR}"
echo "..."
sleep 1
\cp -f ./nvchad/chadrc.lua ~/.config/nvim/lua/chadrc.lua
echo "..."
echo -e "${GREEN}NvChad transparency applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply changes to 'Candy' SDDM theme
echo -e "${BLUE}Applying changes to Candy SDDM theme...${NOCOLOR}"
echo "..."
sleep 1
sudo \cp -f ./sddm/themes/Candy/theme.conf /usr/share/sddm/themes/Candy/theme.conf
echo "..."
echo -e "${GREEN}Candy SDDM theme changes applied!${NOCOLOR}"
echo "..."
sleep 1

# Apply waybar config
echo -e "${BLUE}Applying Waybar config...${NOCOLOR}"
echo "..."
sleep 1
\cp -rf ./waybar/* ~/.config/waybar/
echo "..."
echo -e "${GREEN}Waybar config applied!${NOCOLOR}"
echo "..."
sleep 1

# Install Tailscale
echo -e "${BLUE}Installing Tailscale...${NOCOLOR}"
echo "..."
sleep 1
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
echo "..."
echo -e "${GREEN}Tailscale installed!${NOCOLOR}"
echo "..."
sleep 1

echo -e "${PURPLE}Post-install script complete, hopefully this shit worked!${NOCOLOR}"
