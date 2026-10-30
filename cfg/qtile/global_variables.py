from os import path

_home = path.expanduser("~")


# mod = "control"
mod = "mod4"

terminal = "alacritty"
# terminal = "kitty"
# terminal = "ghostty"
second_terminal = "alacritty"
file_manager = "thunar"

# qtile_path = path.join(_home, ".config", "qtile-polybar")  # development path
qtile_path = path.join(_home, ".config", "qtile")

rofi_applets = qtile_path + "/scripts/"


music_player = qtile_path + "/scripts/qtile_music"
color_picker = qtile_path + "/scripts/qtile_colorpicker"
brightness = qtile_path + "/scripts/qtile_brightness"
volume = qtile_path + "/scripts/qtile_volume"
screenshot = qtile_path + "/scripts/qtile_screenshot"
magnifier = qtile_path + "/scripts/qtile_magnifier"
settings_menu = qtile_path + "/widgets/sidebar/scripts/popup toggle settings"
eyecare = qtile_path + "/scripts/qtile_eyecare"
resources = qtile_path + "/widgets/resources/scripts/toggle"
file_manager = "thunar"
text_editor = "geany"
web_browser = "firefox"
web_browser_secodary = "/sbin/google-chrome-stable"
notify_cmd = "dunstify -u low -h string:x-dunst-stack-tag:qtileconfig"
dashboard = qtile_path + "/widgets/dashboard/launch_dashboard 0"
