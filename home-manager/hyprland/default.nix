{config, pkgs, inputs, ... }: 
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];
      
      exec-once = [
        "waybar &"
        "swww init &"
        "udiskie &"
        "dunst &"
        "/usr/bin/env/polkit-kde-authentication-agent-1"
      ];

      # Variables
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun";
      
      input = {
          kb_layout = "us,ua";
          kb_options = "grp:alt_shift_toggle";
          mouse_refocus = false;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(d79921aa) rgba(fabd2faa) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "master";
        allow_tearing = false;
      };

      decoration = {
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 8, default"
          "borderangle, 1, 6, default"
          "fade, 1, 5, default"
          "workspaces, 1, 4, default"
        ];
      };

      dwindle = {
          pseudotile = "yes";
          preserve_split = "yes";
      };

      master = {
          new_is_master = false;
      };

      misc = {
          force_default_wallpaper = 0;
      };
      
      windowrulev2 = [ 
        "stayfocused, title:^()$,class:^(steam)$"
        "minsize 1 1, title:^()$,class:^(steam)$"
        "workspace 1,class:^(firefox)$"
        "workspace 2,class:^(jetbrains-idea-ce)$"
        "workspace 3,class:^(kitty)$"
        "workspace 4,class:^(discord)$"
        "workspace 5,class:^(Telegram Desktop)$"
        "workspace 9,class:^(steam)$"
        "workspace 10,class:^(YouTube Music)$"
      ];

      windowrule = [
        "float,org.kde.polkit-kde-authentication-agent-1"
      ];

      binds = {
        allow_workspace_cycles = true;
      };

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive"
        "$mainMod, M, exec, wayland-logout"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, F, togglefloating"
        "$mainMod, R, exec, $menu"
        "$mainMod, W, exec, firefox"
        "$mainMod, Y, exec, youtube-music"
        "$mainMod, S, exec, steam"
        "$mainMod, T, exec, telegram-desktop"
        "$mainMod, D, exec, discord"
        "$mainMod, I, exec, idea-community"

        ", Print, exec, grim"
        "$mainMod, Print, exec, grim -g \"$(slurp)\" - | swappy -f -"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "ALT, Tab, workspace, previous"

        # Scratchpad stuff
        "$mainMod, RETURN, togglespecialworkspace, magic"
        "$mainMod SHIFT, RETURN, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
              "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

      binde = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm = [
        # mouse movements
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "$mainMod ALT, mouse:272, resizewindow"
      ];
    };
  };
}
