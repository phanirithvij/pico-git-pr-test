{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    (callPackage ./package.nix { })
    mprocs
    # pueue
    # tmuxp
  ];
}
