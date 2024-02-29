{pkgs, ...}: {
    services.xserver = {
        enable = true;
        xkb.layout = "us";
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
    };


    environment.systemPackages = with pkgs; [
        libsForQt5.polkit-kde-agent
        libsForQt5.bluedevil
        libsForQt5.sddm-kcm
    ];
}