{ lib, pkgs, ... }: {
  imports = [];

  programs.home-manager.enable = true;
  programs.vscode.enable = true;
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    # bbenoist.nix
    # https://github.com/nix-community/vscode-nix-ide
    jnoortheen.nix-ide
  ];
  programs.vscode.userSettings = {
    "nix.enableLanguageServer" = true;
    "nix.formatterPath" = "${lib.getExe pkgs.alejandra}";
    "nix.serverPath" = "${lib.getExe pkgs.nil}";
    "nix.serverSettings"."nil"."formatting"."command" = [ "${lib.getExe pkgs.alejandra}" ];
  };

  xdg.configFile."user-dirs.locale".text = lib.mkForce "en_US";

  systemd.user.startServices = "sd-switch";

  home.stateVersion = lib.mkDefault "23.11";
}
