from libqtile.config import Key
from libqtile import qtile
from libqtile.lazy import lazy
from global_variables import (
    mod,
    notify_cmd,
    terminal,
    rofi_applets,
    file_manager,
    web_browser,
    brightness,
    volume,
    screenshot,
    color_picker,
    dashboard,
)  # >> ignore the next error

#  eww_dashboard = "~/.config/qtile/widgets/dashboard/lauch_dashboard"


keys = [
    # Terminal --
    Key(
        [mod],
        "Return",
        lazy.spawn(terminal),
        desc="Launch terminal with qtile configs",
    ),
    # GUI Apps --
    Key([mod, "shift"], "return", lazy.spawn(file_manager), desc="Launch file manager"),
    #  Key([mod, "shift"], "e", lazy.spawn(text_editor), desc="Launch text editor"),
    Key([mod, "shift"], "f", lazy.spawn(web_browser), desc="Launch web browser"),
    #  Key([""], "", lazy.spawn(web_browser), desc="Launch web browser"),
    Key(["control"], "Escape", lazy.spawn("pkill -9 eww")),
    # Rofi Applets --
    Key(
        [mod],
        "m",
        lazy.spawn(dashboard),
    ),
    Key(
        [mod],
        "n",
        lazy.spawn(rofi_applets + "rofi_launcher"),
        desc="Run application launcher",
    ),
    #  Key(
    #      ["mod1"],
    #      "F1",
    #      lazy.spawn(rofi_applets + "rofi_launcher"),
    #      desc="Run application launcher",
    #  ),
    Key(
        [mod, "shift"],
        "n",
        lazy.spawn(rofi_applets + "network_menu"),
        desc="Run network manager applet",
    ),
    Key(
        [mod],
        "x",
        lazy.spawn(rofi_applets + "rofi_powermenu"),
        desc="Run powermenu applet",
    ),
    Key([mod], "r", lazy.spawn(rofi_applets + "rofi_asroot"), desc="Run asroot applet"),
    Key(
        [mod],
        "s",
        lazy.spawn(rofi_applets + "rofi_screenshot"),
        desc="Run screenshot applet",
    ),
    # Function keys : Brightness --
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn(brightness + " --inc"),
        desc="Increase display brightness",
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn(brightness + " --dec"),
        desc="Decrease display brightness",
    ),
    # Function keys : Volume --
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn(volume + " --inc"),
        desc="Raise speaker volume",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn(volume + " --dec"),
        desc="Lower speaker volume",
    ),
    Key([], "XF86AudioMute", lazy.spawn(volume + " --toggle"), desc="Toggle mute"),
    Key(
        [],
        "XF86AudioMicMute",
        lazy.spawn(volume + " --toggle-mic"),
        desc="Toggle mute for mic",
    ),
    # Function keys : Media --
    Key([], "XF86AudioNext", lazy.spawn("mpc next"), desc="Next track"),
    Key([], "XF86AudioPrev", lazy.spawn("mpc prev"), desc="Previous track"),
    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle"), desc="Toggle play/pause"),
    Key([], "XF86AudioStop", lazy.spawn("mpc stop"), desc="Stop playing"),
    # Screenshots --
    Key([], "Print", 
        lazy.spawn(rofi_applets + "rofi_screenshot"),
         desc="Take Screenshot"),
    Key(
        ["control"],
        "Print",
        lazy.spawn(screenshot + " --in5"),
        desc="Take Screenshot in 5 seconds",
    ),
    Key(
        ["shift"],
        "Print",
        lazy.spawn(screenshot + " --in10"),
        desc="Take Screenshot in 10 seconds",
    ),
    Key(
        ["control", "shift"],
        "Print",
        lazy.spawn(screenshot + " --win"),
        desc="Take Screenshot of active window",
    ),
    Key(
        [mod],
        "Print",
        lazy.spawn(screenshot + " --area"),
        desc="Take Screenshot of selected area",
    ),
    # Misc --
    Key([mod], "p", lazy.spawn(color_picker), desc="Run colorpicker"),
    Key(
        ["mod1", "control"],
        "l",
        lazy.spawn("betterlockscreen --lock"),
        desc="Run lockscreen",
    ),
    # WM Specific --
    #  Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    # Control Qtile
    Key(
        [mod, "shift"],
        "r",
        lazy.restart(),
        lazy.spawn(notify_cmd + ' "Restarting Qtile..."'),
        lazy.spawn(rofi_applets + "wallpaper"),
        lazy.spawn("~/.config/qtile/scripts/autostart"),
        desc="Restart Qtile",
    ),
    Key(
        [mod, "shift"],
        "q",
        lazy.shutdown(),
        lazy.spawn(notify_cmd + ' "Exiting Qtile..."'),
        desc="Shutdown Qtile",
    ),
    # Switch between windows
    Key([mod, "control"], "l", lazy.layout.left(), desc="Move focus to left"),
    Key([mod, "control"], "h", lazy.layout.right(), desc="Move focus to right"),
    Key([mod, "control"], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod, "control"], "k", lazy.layout.up(), desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "control", "shift"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control", "shift"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
    Key(
        [mod, "control", "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"
    ),
    Key([mod, "control", "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key(
        [mod, "control"],
        "Return",
        lazy.layout.normalize(),
        desc="Reset all window sizes",
    ),
    # Toggle floating and fullscreen
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Put the focused window to/from fullscreen mode",
    ),
    # Go to next/prev group
    Key(
        [mod, "mod1"],
        "Right",
        lazy.screen.next_group(),
        desc="Move to the group on the right",
    ),
    Key(
        [mod, "mod1"],
        "Left",
        lazy.screen.prev_group(),
        desc="Move to the group on the left",
    ),
    # Back-n-forth groups
    Key([mod], "b", lazy.screen.toggle_group(), desc="Move to the last visited group"),
    # Change focus to other window
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    # Increase the space for master window at the expense of slave windows
    Key(
        [mod],
        "equal",
        lazy.layout.increase_ratio(),
        desc="Increase the space for master window",
    ),
    # Decrease the space for master window in the advantage of slave windows
    Key(
        [mod],
        "minus",
        lazy.layout.decrease_ratio(),
        desc="Decrease the space for master window",
    ),
    # Toggle between split and unsplit sides of stack.
    Key(
        [mod, "shift"],
        "s",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key(
        [mod],
        "g",
        lazy.window.toggle_floating(),
        desc="Toggle floating",
    ),
    # polybar
    Key(
        [mod, "shift"],
        "p",
        lazy.spawn(rofi_applets + "polybar_setup --toggle"),
        desc="kill polybar",
    ),
]
