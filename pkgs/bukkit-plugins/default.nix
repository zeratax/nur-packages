{ lib, pkgs }:

lib.makeScope pkgs.newScope (self:
  with self; {
    harbor = callPackage ./harbor { };
    dynmap = callPackage ./dynmap { };
    discordsrv = callPackage ./discordsrv { };
  })
