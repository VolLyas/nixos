{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ../../modules/plasma5.nix
            ../../modules/dev-tools.nix
            ../../modules/gaming-tools.nix
            ../../modules/social.nix
        ];

    boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        kernelPackages = pkgs.linuxPackages_latest;
    };

    fileSystems."/mnt/Data" = {
        device = "/dev/disk/by-uuid/7015222328194409";
        fsType = "ntfs";
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking = {
        hostName = "nixos"; # Define your hostname.
        networkmanager.enable = true;
    };

    time.timeZone = "Europe/Kyiv";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "uk_UA.UTF-8";
        LC_IDENTIFICATION = "uk_UA.UTF-8";
        LC_MEASUREMENT = "uk_UA.UTF-8";
        LC_MONETARY = "uk_UA.UTF-8";
        LC_NAME = "uk_UA.UTF-8";
        LC_NUMERIC = "uk_UA.UTF-8";
        LC_PAPER = "uk_UA.UTF-8";
        LC_TELEPHONE = "uk_UA.UTF-8";
        LC_TIME = "uk_UA.UTF-8";
    };

    sound.enable = true;

    hardware = {
        pulseaudio.enable = false;
        bluetooth = {
            enable = true; 
            powerOnBoot = true; 
        }
    };

    security = {
        rtkit.enable = true;
        polkit.enable = true;
    };

    services = {
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
        printing.enable = true;
    };

    users.users.vl = {
        isNormalUser = true;
        description = "Lyas D. Vol";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "24.05"; # Did you read the comment?
}
