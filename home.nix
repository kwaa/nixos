# https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/home-manager/home.nix
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];
  nixpkgs = {};

  home.username = "kwa";
  home.homeDirectory = "/home/kwa";

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}