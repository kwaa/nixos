{ lib
, autoPatchelfHook
, dpkg
, fetchurl
, libayatana-appindicator
, openssl
, stdenv
, webkitgtk
, wrapGAppsHook3
}:

stdenv.mkDerivation rec {
  pname = "openai-translator";
  version = "0.4.32";

  src = fetchurl {
    url = "https://github.com/openai-translator/openai-translator/releases/download/v${version}/OpenAI.Translator_${version}_amd64.deb";
    hash = "sha256-RjysU72MFeRbIrJh8s8egVLWcSGxGlTNOBd+4wB0XeU=";
  };

  nativeBuildInputs = [
    dpkg
    wrapGAppsHook3
    autoPatchelfHook
  ];

  buildInputs = [
    openssl
    webkitgtk
  ];

  runtimeDependencies = [
    libayatana-appindicator
  ];

  installPhase = ''
    runHook preInstall

    mv usr/* $out

    runHook postInstall
  '';

  meta = {
    description = "Cross-platform desktop application for translation based on ChatGPT API";
    homepage = "https://github.com/openai-translator/openai-translator";
    changelog = "https://github.com/openai-translator/openai-translator/releases/tag/v${version}";
    license = lib.licenses.agpl3Only;
    mainProgram = "app";
    maintainers = with lib.maintainers; [ kwaa ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
