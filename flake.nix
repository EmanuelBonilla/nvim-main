{
  description = "Nvim Flake for develop";
  inputs.nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";
  outputs = {self, nixpkgs}:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        bashInteractive
        lua-language-server
        gcc
        nodejs
        fzf
      ];
    };
  };
}
