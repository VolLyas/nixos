{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        krita
        gimp
        youtube-music
    ];
}