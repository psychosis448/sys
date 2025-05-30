# NixOS Systems Configurations

- [nixos](https://nixos.org/)
- [flake-parts](https://github.com/hercules-ci/flake-parts)
- [nix-home-manager](https://github.com/nix-community/home-manager)
- [nixos-anywhere](https://github.com/numtide/nixos-anywhere)
- [nixos-generators](https://github.com/nix-community/nixos-generators)

```sh
## format disks, if not using nixos-anywhere for installation
nix run --experimental-features "nix-command flakes" \
    github:nix-community/disko -- --mode disko ./systems/$SYS/disko-configuration.nix

## (re-)install system
sudo nixos-install --flake .#$SYS

## rebuild system
sudo nixos-rebuild switch --flake .#$SYS

## update system
nix flake update
sudo nixos-rebuild switch --flake .#$SYS

## update specific input
nix flake lock --update-input $INPUT
sudo nixos-rebuild switch --flake .#$SYS
```

## Agares

Agares is a [Wayland](https://wiki.archlinux.org/title/Wayland) based laptop.
Theming is based on [modus-themes](https://github.com/protesilaos/modus-themes)
by [Πρωτεσίλαος](https://protesilaos.com/);
partially adapted from [miikanissi](https://github.com/miikanissi/modus-themes.nvim?tab=readme-ov-file#extras).

<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/3/38/Agares.jpg" alt="Agares, dargestellt in einer Ausgabe des Dictionnaire Infernal von 1863" width="50%"/>
</div>

## Malphas

Malphas is a [Coder](https://coder.com/) Kubernetes Pod development environment.

<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Malthas.jpg" alt="Malphas, by Louis Le Breton, 1863" width="50%" />
</div>
