# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage
{ pkgs ? import <nixpkgs> { } }: {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  hmModules = import ./hm-modules;
  overlays = import ./overlays; # nixpkgs overlays

  formats = import ./pkgs/formats {
    inherit pkgs;
    inherit (pkgs) lib;
  };

  alfred = pkgs.callPackage ./pkgs/alfred { };
  latexit = pkgs.callPackage ./pkgs/latexit { };

  nixos-wallpapers = pkgs.callPackage ./pkgs/nixos-wallpapers { };

  buildFirefoxExtension = pkgs.callPackage ./pkgs/build-firefox-extension { };
  firefoxExtensionHooks = pkgs.callPackage ./pkgs/build-firefox-extension/hooks { };
}
