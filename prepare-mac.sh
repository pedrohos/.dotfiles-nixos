sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update

git clone git@github.com:pedrohos/.dotfiles-nixos.git ~/.dotfiles
sudo ln -sf ~/.dotfiles/configuration.nix /etc/nixos/configuration.nix

sudo nixos-rebuild switch

