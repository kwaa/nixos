{ lib, pkgs, ... }: {
  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [ jnoortheen.nix-ide ];
    userSettings = {
      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = lib.getExe pkgs.nixpkgs-fmt;
      "nix.serverPath" = lib.getExe pkgs.nil;
      "nix.serverSettings"."nil"."formatting"."command" = [ "${lib.getExe pkgs.nixpkgs-fmt}" ];
    };
  };
}
