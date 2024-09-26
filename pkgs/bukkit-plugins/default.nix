{
  lib,
  pkgs,
}:
lib.makeScope pkgs.newScope (self:
    with self; {
      bluemap = callPackage ./bluemap {};
      bluemap-marker-manager = callPackage ./bluemap-marker-manager {};
      harbor = callPackage ./harbor {};
      dynmap = callPackage ./dynmap {};
      discordsrv = callPackage ./discordsrv {};
      simple-voice-chat = callPackage ./simple-voice-chat {};
    })
