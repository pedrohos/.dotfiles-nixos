# Dotfiles for NixOS

Commands to update env:
```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
sudo nix-channel --update

sudo git clone https://github.com/pedrohos/.dotfiles-nixos ~/.dotfiles
sudo ln -sf ~/.dotfiles/configuration.nix /etc/nixos/configuration.nix
sudo ln -sf /etc/nixos/hardware-configuration.nix ~/.dotfiles/hardware-configuration.nix
mkdir -p ~/.config/home-manager && ln -s ~/.config/home-manager/home.nix ~/.config/home-manager/home.nix

sudo nixos-rebuild switch
```
