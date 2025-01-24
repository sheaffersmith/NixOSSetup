{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";  # Add Home Manager input
  };

  outputs = inputs: let
    system = "x86_64-linux";
    inherit (inputs.nixpkgs) lib;

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      sheaffersmith = lib.nixosSystem {
        specialArgs = { inherit pkgs inputs; };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.home-manager  # Add Home Manager module
        ];
      };
    };
  };
}

