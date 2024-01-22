{ config, lib, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        spacing = 4;
        modules-left = [ "custom/wlogout" "hyprland/workspaces" ];
        modules-center = [ "custom/media" ];
        modules-right = [ "tray" "pulseaudio" "hyprland/language" "cpu" "memory" "temperature" "network" "clock" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
             "1" = "";
             "2" = "";
             "3" = "";
             "4" = "󰙯";
             "5" = "";
             "9" = "󰓓";
             "10" = "󰗃";
             "urgent" = "";
             "active" = "";
             "default" = "";
          };
        };
        "hyprland/language" = {
            format = "{}";
            format-en = "US";
            format-uk = "UA";
        };
        pulseaudio = {
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon}";
            format-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                default = ["" ""];
            };
            scroll-step = 5;
            on-click = "pavucontrol";
        };
        network = {
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        cpu = {
            format = "{usage}% ";
            tooltip = false;
        };
        memory = {
            interval = 30;
            format = "{}% ";
            max-length = 10;
        };
        temperature = {
            "critical-threshold" = 80;
            format = "{temperatureC}°C {icon}";
            format-icons = ["" "" ""];
        };
        tray = {
            icon-size = 24;
            spacing = 10;
        };
        clock = {
            "format-alt" = "{:%d-%m-%Y}";
        };
        "custom/wlogout" = {
          on-click = "wlogout -p layer-shell -b 5";
          on-click-right = "~/.config/waybar/scripts/random-wall.sh";
          format = "󱄅";
          tooltip = false;
        };
      };
    };
    style =
      "
        * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-weight: bold;
        }

        window#waybar {
            background-color: rgba(26, 26, 26, 0.5);
            transition-property: background-color;
            transition-duration: .5s;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        button {
            /* Avoid rounded borders under each button name */
            border: none;
            min-width: 20px;
            padding-right: 14px;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        button:hover {
            background: inherit;
            box-shadow: inset 0 -1px #ffffff;
        }

        #workspaces button {
            background-color: transparent;
            color: #fbf1c7;
        }

        #workspaces button:hover {
            background: rgba(0, 0, 0, 0.2);
        }

        #workspaces button.active {
            background-color: #928374;
            border: none;
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        #clock,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #network,
        #pulseaudio,
        #custom-media,
        #tray,
        #language {
            padding: 0 10px;
            font-size: 20px;
        }

        .modules-left {
            font-size: 22px;
        }

        #clock {
            background-color: #fbf1c7;
        }

        @keyframes blink {
            to {
                background-color: #ffffff;
                color: #000000;
            }
        }

        label:focus {
            background-color: #000000;
        }

        #cpu {
            background-color: #98971a;
        }

        #memory {
            background-color: #689d6a;
        }

        #disk {
            background-color: #964B00;
        }

        #network {
            background-color: #458588;
        }

        #network.disconnected {
            background-color: #9d0006;
        }

        #pulseaudio {
            background-color: #f1c40f;
        }

        #pulseaudio.muted {
            background-color: #90b1b1;
        }

        #custom-media {
            background-color: #66cc99;
            min-width: 100px;
        }

        #custom-media.custom-spotify {
            background-color: #66cc99;
        }

        #custom-media.custom-vlc {
            background-color: #ffa000;
        }

        #temperature {
            background-color: #d65d0e;
        }

        #temperature.critical {
            background-color: #cc241d;
        }

        #tray {
            background-color: #665c64;
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
        }

        #language {
            background: #427b58;
            font-weight: bold;
        }
        #custom-wlogout {
            font-size: 26px;
            background: #d79921;
            min-width: 40px;
            padding-right: 6px;
        }
      ";
  };
  home.file.".config/waybar/scripts/random-wall.sh".source = ./scripts/random-wall.sh;
}
