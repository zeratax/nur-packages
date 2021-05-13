{ config, lib, pkgs }:

lib.makeScope pkgs.xfce.newScope (self: with self; {
    # html-sanitizer = callPackage ./html-sanitizer { };

    # matrix-nio = callPackage ./matrix-nio { };

    # pyfastcopy = callPackage ./pyfastcopy { };
    hsluv = callPackage ./hsluv { };

    baron = callPackage ./baron { };

    redbaron = self.callPackage ./redbaron { };
})
 