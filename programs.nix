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

        #System76
         #system76-acpi-dkms
         system76-firmware
         system76-keyboard-configurator 
         system76-power
         system76-scheduler

        #graphics
        intel-graphics-compiler  

    ];}
