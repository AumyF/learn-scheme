{ pkgs ? import <nixpkgs> { } }:
let
  gaucheBS = pkgs.gaucheBootstrap.overrideAttrs (attr: rec {
    version = "0.9.10";
    src = pkgs.fetchurl {
      url = "mirror://sourceforge/gauche/Gauche-${version}.tgz";
      sha256 = "DznfHa7FZoC1QiEbCFF5yyLoIgQF2uFdnXRcVqY6JTI=";
    };
  });
  gauche = pkgs.gauche.overrideAttrs
    (attr: rec{
      version = "0.9.11";
      src = pkgs.fetchFromGitHub {
        owner = "shirok";
        repo = "gauche";
        rev = "release0_9_11";
        sha256 = "9mNto0jZeIGftsn2mkn/aJ9Stwuv2oDlVdtRLYOjbeU=";
      };
      nativeBuildInputs = with pkgs;[
        gaucheBS
        pkg-config
        texinfo
        autoreconfHook
      ];
      buildInputs = with pkgs; [
        libiconv
        gdbm
        openssl
        zlib
        mbedtls
        cacert
        # readline
      ];

    });
in
pkgs.mkShell {
  buildInputs = with pkgs;[
    gauche
    rlwrap
  ];
}
