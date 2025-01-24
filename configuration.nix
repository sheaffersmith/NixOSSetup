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
        blueman.enable = true; # Optional: for GUI Bluetooth management
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
        bluetooth.powerOnBoot = true;
        acpilight.enable = true; # keyboard backlight
        pulseaudio.enable = false;
    };

    # Enable the Magic Mouse Kernel Module
    boot.kernelModules = [ "hid-magicmouse" ];

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
            desktopManager.pantheon.enable = true;
            
            # X11 input configuration for the Magic Mouse
            inputClassSections = [
                ''
                  Section "InputClass"
                    Identifier "Apple Magic Mouse"
                    MatchProduct "Apple Magic Mouse"
                    MatchIsPointer "on"
                    Driver "evdev"
                    Option "Emulate3Buttons" "false"
                    Option "VertScrollDelta" "-100"
                    Option "HorizScrollDelta" "-100"
                  EndSection
                ''
            ];
        };
    };

    time.timeZone = "America/New_York"; 

    nix.settings.experimental-features = [ "flakes" "nix-command"];

    system.stateVersion = "24.11";
}
