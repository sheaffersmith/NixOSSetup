{
    pkgs,
    config,
    ...
}: {
    environment.systemPackages = with pkgs; [
        # Basic utilitiess
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

        # Audio controlcustomizable terminal linux
        pavucontrol
        pulsemixer
        pulseaudio-ctl
        
        # Communication
        mattermost-desktop
        zoom-us

        #Coding
	    vscode
	    docker
        openvpn
        dropbox
        arduino
        #asana
        home-manager
        spotify
        ddev
        _1password-gui
    ];
}
