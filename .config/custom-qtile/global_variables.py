from os import path

home = path.expanduser("~")


mod = "control"
terminal = "kitty"

qtile_path = path.join(path.expanduser("~"), ".config", "custom-qtile")
#  qtile_path = path.join(path.expanduser("~"), ".config", "qtile")
rofi_applets = home + "/.config/custom-qtile/scripts/"
