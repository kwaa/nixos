{ pkgs, ... }:
let
  logo = pkgs.fetchurl {
    url = "https://github.com/sn0wm1x.png";
    hash = "sha256-7gAf++UN5o7+aP8jLno46zaEtni7vwNBrxD1pDkcA3A=";
  };
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      # "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        type = "kitty-direct"; # TODO: remove this
        source = "${logo}";
      };
      # https://github.com/fastfetch-cli/fastfetch/blob/dev/presets/screenfetch.jsonc
      modules = [
        "title"
        {
          "type" = "os";
          "format" = "SN0WM1X (Nix) OS ({11}, {12})";
        }
        "kernel"
        "uptime"
        {
          "type" = "packages";
          "format" = "{all}";
        }
        "shell"
        {
          "type" = "display";
          "key" = "Resolution";
          "compactType" = "original";
        }
        "de"
        "wm"
        "wmtheme"
        {
          "type" = "terminalfont";
          "key" = "font";
        }
        {
          "type" = "disk";
          "folders" = "/";
          "key" = "Disk";
        }
        "cpu"
        "gpu"
        {
          "type" = "memory";
          "key" = "RAM";
        }
      ];
    };
  };

  home.shellAliases = {
    nf = "fastfetch";
    neofetch = "fastfetch";
  };
}
