{
  description = "NixOS Systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-root.url = "github:srid/flake-root";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    disko.url = "github:nix-community/disko";
    devshell.url = "github:numtide/devshell";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    flake-parts,
    treefmt-nix,
    flake-root,
    devshell,
    disko,
    home-manager,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        treefmt-nix.flakeModule
        flake-root.flakeModule
        devshell.flakeModule
      ];

      systems = [
        "x86_64-linux"
      ];

      perSystem = {
        config,
        pkgs,
        self',
        ...
      }: {
        legacyPackages.homeConfigurations.malphas = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [
            ./hosts/coder/homemanager-configuration.nix
          ];
        };

        packages.activateMalphas = self'.legacyPackages.homeConfigurations.malphas.activationPackage;

        treefmt = {
          inherit (config.flake-root) projectRootFile;
          package = pkgs.treefmt;
          programs = {
            alejandra.enable = true;
            prettier.enable = true;
            stylua.enable = true;
          };
          settings.global.excludes = [
            ".envrc"
            ".gitignore"
            ".direnv/**"
          ];
        };

        devshells = {
          default = {
            env = [
              {
                name = "NIX_CONFIG";
                value = "experimental-features = nix-command flakes";
              }
            ];
            commands = [
              {
                help = "Rebuild NixOS configuration for agares";
                name = "agares";
                command = "sudo nixos-rebuild switch --flake .#agares";
              }
              {
                help = "Rebuild HM configuration for marlphas";
                name = "malphas";
                command = "nix run .#activateMalphas -- switch --flake .#malphas";
              }
            ];
            packages = with pkgs; [home-manager];
          };
        };
      };

      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.
        nixosConfigurations = {
          agares = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/le495/configuration.nix
              disko.nixosModules.disko
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.users.user = import ./hosts/le495/homemanager-configuration.nix;
              }
            ];
          };
        };
      };
    };
}
