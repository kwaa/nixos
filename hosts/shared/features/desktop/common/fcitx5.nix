{ pkgs, ... }:
{
  # https://wiki.nixos.org/wiki/Fcitx5
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-chinese-addons
    # TODO: fcitx5-pinyin-zhwiki
    # TODO: fcitx5-pinyin-moegirl
  ];

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  # TODO: https://github.com/catppuccin/fcitx5
}
