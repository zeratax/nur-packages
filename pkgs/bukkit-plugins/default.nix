{
  lib,
  pkgs,
}:
lib.makeScope pkgs.newScope (self:
    with self; {
      bluemap = callPackage ./bluemap {};
      bluemap-marker-manager = callPackage ./bluemap-marker-manager {};
      bluemap-offline-player-markers = callPackage ./bluemap-offline-player-markers {};
      harbor = callPackage ./harbor {};
      dynmap = callPackage ./dynmap {};
      discordsrv = callPackage ./discordsrv {};
      simple-voice-chat = callPackage ./simple-voice-chat {};
    })
