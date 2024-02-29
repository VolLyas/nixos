{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        git
        vscode
        neofetch
    ];

    programs = {
        neovim = {
            enable = true;
            defaultEditor = true;
        };
    };
}