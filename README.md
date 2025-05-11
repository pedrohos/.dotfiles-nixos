# Dotfiles for NixOS

## Installation

### Step 1 - Prepare env
Commands to update env and install NixOS config for mac:
```sudo ./prepare-mac.sh```

Commands to update env and install NixOS config for other system:
```sudo ./prepare-other.sh```

### Step 2 - Install
For Mac:
```bash
sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild build --flake .#nixos-mac --impure --show-trace
```

For desktop:
```bash
sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild build --flake .#nixos-desktop --impure --show-trace
```

For ROG:
```bash
sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild build --flake .#nixos-rog --impure --show-trace
```
### Step 3 - Prepare env again for current user
The script of prepraration should be rerun after the user being setup.
Commands to update env and install NixOS config for mac:
```sudo ./prepare-mac.sh```

Commands to update env and install NixOS config for other system:
```sudo ./prepare-other.sh```
