{
    pkgs,
    inputs,
    config,
    ...
}: let
    username = "sheaffersmith";
in {
    imports = [
        ./hardware-configuration.nix
        ./programs.nix
    ];

    boot.loader = {
        systemd-boot.enable = true;
        efi = {
            canTouchEfiVariables = true;
        };
    };

    networking = {
        networkmanager.enable = true;
        hostName = username + "Computer";
    };

    services = {
        openssh.enable = true;
        printing.enable = true;
        pipewire = {
            # audio
            enable = true;
            pulse.enable = true;
            wireplumber.enable = true;
        };
    };
    
    hardware = {
        bluetooth.enable = true;
        acpilight.enable = true; # keyboard backlight
        pulseaudio.enable = false;
    };

    users.users."${username}" = {
        isNormalUser = true;
        initialPassword = "OMb2022!";
        extraGroups = [ "audio" "networkmanager" "video" "wheel" "docker" "dialout" "plugdev" ];
    };

    # Display Manager
    services = {
        xserver = {
            enable = true;
            displayManager.lightdm.enable = true;
            desktopManager.cinnamon.enable = true;
        };
    };

    time.timeZone = "America/New_York"; 

    nix.settings.experimental-features = [ "flakes" "nix-command"];

    system.stateVersion = "24.11";
}
