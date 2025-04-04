{
  description = "The base nix flake.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = { nixpkgs, ... }@inputs: let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    eachSystem = nixpkgs.lib.genAttrs systems;
    withPkgs = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    devShells = eachSystem (system: let
      pkgs = withPkgs system;
    in { 
      default = pkgs.mkShell {
        packages = with pkgs; [ steam-run ouch ];
        nativeBuildInputs = with pkgs; [ godot ];
      };
    });
  };
}
