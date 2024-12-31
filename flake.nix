{
  description = "NixOS Systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-root.url = "github:srid/flake-root";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    flake-parts,
    treefmt-nix,
    disko,
    home-manager,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.flake-root.flakeModule
      ];

      systems = [
        "x86_64-linux"
      ];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
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
        devShells = {
          default = pkgs.mkShell {
            # Enable experimental features without having to specify the argument
            NIX_CONFIG = "experimental-features = nix-command flakes";
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
