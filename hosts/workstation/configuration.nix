{ config, pkgs, inputs, ... }:

{
  imports =  [
      ../../modules
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "drm.vblankoffdelay=0" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_ALL = "en_US.UTF-8";

  modules = {
    communication.enable = true;
    utils.enable = true;
    development.enable = true;
    fonts.enable = true;
    gaming.enable = true;
    media.enable = true;
    hyprland.enable = true;
  };

  services = {
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    flatpak.enable = true;
  };

  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };

  sound.enable = true;
  security.rtkit.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.zsh = {
    enable = true;
        shellAliases = {
            snrfw = "sudo nixos-rebuild switch --flake ./nixos#workstation";
        };
  };

  users.users.vl = {
    isNormalUser = true;
    extraGroups = [ "input" "wheel" ];
    description  = "Lyas D. Vol";
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "vl" = import ../../home-manager/home.nix;
    };
  };

  fileSystems."/mnt/Data" =
    { device = "/dev/disk/by-label/Data";
      fsType = "ext4";
    };

  fileSystems."/mnt/Files" =
    { device = "/dev/disk/by-label/Files";
      fsType = "ext4";
    };

  system.stateVersion = "23.11";
}
