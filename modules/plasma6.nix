{pkgs, ...}: {
    services.xserver = {
        enable = true;
        xkb.layout = "us";
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
    };


    environment.systemPackages = with pkgs; [
        kdePackages.polkit-kde-agent-1
        kdePackages.bluedevil
        kdePackages.sddm-kcm
    ];
}