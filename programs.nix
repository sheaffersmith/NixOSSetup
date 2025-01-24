{
    pkgs,
    config,
    ...
}: {
    environment.systemPackages = with pkgs; [
 
        # Basic utilities
        vim
        wget
        screen
        git
        curl
        tmux
        unar
        playerctl
        brightnessctl
        neofetch

        # Web
        google-chrome

        # Word processing
        hunspellDicts.en-us
        libreoffice
        hunspell

        # Audio control
        pavucontrol
        pulsemixer
        pulseaudio-ctl

        # Communication
        mattermost-desktop
        zoom-us

        # Coding
        vscode
        docker

        # System76
        system76-firmware
    ];

}

