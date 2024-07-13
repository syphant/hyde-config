#!/usr/bin/zsh

RED='\033[0;31m'
GREEN='\032[0;32m'
BLUE='\032[0;34m'
PURPLE='\032[0;35m'
CYAN='\032[0;36m'
NOCOLOR='\033[0m'

# Uninstall unneeded packages
echo
echo -e "${BLUE}Uninstalling unneeded packages...${NOCOLOR}"
echo
un code vim kwallet
echo
echo -e "${GREEN}Unneeded packages uninstalled!${NOCOLOR}"
echo

# Install needed packages
echo
echo -e "${BLUE}Installing needed packages...${NOCOLOR}"
echo
in bat cava flatpak font-manager intel-media-driver gnome-keyring protonvpn spotify tmatrix genact brave-bin neovim obs-studio podman distrobox unzip vscodium spicetify-cli
echo
echo -e "${GREEN}Needed packages installed!${NOCOLOR}"
echo

# Install flatpak packages
echo
echo -e "${BLUE}Installing flatpaks...${NOCOLOR}"
echo
flatpak install com.discordapp.Discord -y
flatpak install com.parsecgaming.parsec -y
flatpak install com.moonlight_stream.Moonlight -y
echo
echo -e "${GREEN}Flatpaks installed!${NOCOLOR}"
echo

# Install Oh My Posh
echo
echo -e "${BLUE}Installing Oh My Posh...${NOCOLOR}"
echo
curl -s https://ohmyposh.dev/install.sh | bash -s
echo
echo -e "${GREEN}Oh My Posh installed!${NOCOLOR}"
echo

# Apply Oh My Posh config
echo
echo -e "${BLUE}Applying Oh My Posh config...${NOCOLOR}"
echo
mkdir ~/.config/ohmyposh
\cp -f ./ohmyposh/config.json ~/.config/ohmyposh/config.json
echo
echo -e "${GREEN}Oh My Posh config applied!${NOCOLOR}"
echo

# Apply ZSH config
echo
echo -e "${BLUE}Applying ZSH config...${NOCOLOR}"
echo
\cp -f .zshrc ~/.zshrc
echo
echo -e "${GREEN}ZSH config applied!${NOCOLOR}"
echo

# Apply CAVA config
echo
echo -e "${BLUE}Applying CAVA config...${NOCOLOR}"
echo
\cp -f ./cava/config ~/.config/cava/config
echo
echo -e "${GREEN}CAVA config applied!${NOCOLOR}"
echo

# Apply changes to Catppuccin Mocha HyDE theme
echo
echo -e "${BLUE}Applying changes to Catppuccin Mocha HyDE theme...${NOCOLOR}"
echo
rm -rf ~/.config/hyde/themes/Catppuccin\ Mocha/wallpapers/*
\cp -f ./hyde/themes/Catppuccin\ Mocha/* ~/.config/hyde/themes/Catppuccin Mocha/
echo
echo -e "${GREEN}Catppuccin Mocha HyDE theme changes applied!${NOCOLOR}"
echo

# Apply Kitty config
echo
echo -e "${BLUE}Applying Kitty config...${NOCOLOR}"
echo
\cp -f ./kitty/kitty.conf ~/.config/kitty/kitty.conf
echo
echo -e "${GREEN}Kitty config applied!${NOCOLOR}"
echo

# Apply Fastfetch config
echo
echo -e "${BLUE}Applying Fastfetch config...${NOCOLOR}"
echo
rm -rf ~/.config/fastfetch/*
cp ./fastfetch/* ~/.config/fastfetch/
echo
echo -e "${GREEN}Fastfetch config applied!${NOCOLOR}"
echo

# Apply Hyprland userprefs
echo
echo -e "${BLUE}Applying Hyprland userprefs...${NOCOLOR}"
echo
\cp -f ./hypr/userprefs.conf ~/.config/hypr/userprefs.conf
echo
echo -e "${GREEN}Hyprland userprefs applied!${NOCOLOR}"
echo

# Install NvChad
echo
echo -e "${BLUE}Installing NvChad...${NOCOLOR}"
echo
git clone https://github.com/NvChad/starter ~/.config/nvim
echo
echo -e "${GREEN}Installed NvChad! ${RED}YOU WILL NEED to enter nvim and then run ${CYAN}:MasonInstallAll ${RED}after lazy.nvim finishes downloading plugins!!!${NOCOLOR}"
echo

# Apply NvChad transparency
echo
echo -e "${BLUE}Applying NvChad transparency...${NOCOLOR}"
echo
\cp -f ./nvchad/chadrc.lua ~/.config/nvim/lua/chadrc.lua
echo
echo -e "${GREEN}NvChad transparency applied!${NOCOLOR}"
echo

# Apply changes to 'Candy' SDDM theme
echo
echo -e "${BLUE}Applying changes to Candy SDDM theme...${NOCOLOR}"
echo
sudo \cp -f ./sddm/themes/Candy/theme.conf /usr/share/sddm/themes/Candy/theme.conf
echo
echo -e "${GREEN}Candy SDDM theme changes applied!${NOCOLOR}"
echo

# Install Tailscale
echo
echo -e "${BLUE}Installing Tailscale...${NOCOLOR}"
echo
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
echo
echo -e "${GREEN}Tailscale installed!${NOCOLOR}"
echo
echo
echo -e "${PURPLE}Post-install script complete, hopefully this shit worked!${NOCOLOR}"