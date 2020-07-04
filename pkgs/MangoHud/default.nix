{ stdenv, lib, fetchFromGitHub
, pkgconfig, ninja, meson
, python3Packages, glslang, libglvnd
, xorg, git, vulkan-loader, vulkan-headers, vulkan-tools, mesa, dbus }:

stdenv.mkDerivation rec {
  pname = "mangohud";
  version = "0.4.1";

  src = fetchFromGitHub {
    fetchSubmodules = true;
    owner = "flightlessmango";
    repo = "MangoHud";
    #rev = "v${version}";
    rev = "01233e5f1f719a7ee0038af72229c209331fe8b0";
    sha256 = "1fzh07bw8cvm75f60fil4hhkgdxhg6lk54zpma4z0rc376gj59yy";
  };

  mesonFlags = [
    "-Dappend_libdir_mangohud=false"
    "-Dwith_xnvctrl=disabled"
    "-Duse_system_vulkan=enabled"
  ];

  buildInputs = [
    libglvnd glslang python3Packages.Mako
    xorg.libX11 vulkan-loader vulkan-headers vulkan-tools mesa dbus
  ];

  nativeBuildInputs = [
    pkgconfig meson ninja
    python3Packages.python python3Packages.Mako dbus
    git
  ];

  preConfigure = ''
    ls "${vulkan-headers}/share/vulkan/registry"
    echo "----------------------- $out -----------------"
    mkdir -p "$out/share/vulkan/"
    ln -sf "${vulkan-headers}/share/vulkan/registry/" $out/share/vulkan/
    ln -sf "${vulkan-headers}/include" $out
  '';

  meta = with lib; {
    description = "A fancy, customizable, keyboard-operable Qt/QML+Python Matrix chat client for encrypted and decentralized communication.";
    homepage = "https://github.com/mirukana/mirage";
  };
}