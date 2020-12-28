{ callPackage, vscode-utils, lib }:
let
  inherit (vscode-utils) buildVscodeMarketplaceExtension;
in

rec {
  b4dm4n.nixpkgs-fmt  = callPackage ./nixpkgs-fmt {};

  hookyqr.beautify = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "beautify";
      publisher = "HookyQR";
      version = "1.5.0";
      sha256 = "1c0kfavdwgwham92xrh0gnyxkrl9qlkpv39l1yhrldn8vd10fj5i";
    };
    meta = with lib; {
      # license = licenses.mit;
      # maintainers = [ maintainers.zeratax ];
    };
  };
}
