{ config, lib, pkgs, ... }:

{
  partions = {
    boot = {
      device = "/dev/sda1";
      fsType = "ext2";
      size = "256MiB";
    };
    root = {
      device = "/dev/sda2";
      fsType = "btrfs";
      size = "auto";
    };
  };
}
