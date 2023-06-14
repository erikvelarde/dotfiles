from libqtile import bar
from libqtile.config import Screen
from .widgets import archzone_widgets, marianne_widgets, diana_widgets
from theme.colors import colors  # import theme.colors couldn't... >>> ignore that error
from theme.global_styles import margin_vertical, margin_horizontal
from theme.colors import theme


def status_bar(widget):
    return bar.Bar(
        widget,
        24,
        margin=[margin_horizontal, margin_vertical, margin_horizontal, margin_vertical],
        background=colors["background"],
        border_width=[
            margin_horizontal,
            margin_vertical,
            margin_horizontal,
            margin_vertical,
        ],
        border_color=colors["background"],
    )


screens = [
    Screen(top=status_bar(archzone_widgets())),  # monitor 1
    Screen(top=status_bar(archzone_widgets())),  # monitor 2
]

if theme == "archzone":
    screens = [
        # I have two monitors, if you have only one, remove this line or if you have even more than me,
        # create a new Screen()
        Screen(top=status_bar(archzone_widgets())),  # monitor 1
        Screen(top=status_bar(archzone_widgets())),  # monitor 2
    ]

if theme == "Marianne":
    screens = [
        Screen(top=status_bar(marianne_widgets())),  # monitor 1
        Screen(top=status_bar(marianne_widgets())),  # monitor 2
    ]
if theme == "Diana":
    screens = [
        Screen(bottom=status_bar(diana_widgets())),  # monitor 1
        Screen(bottom=status_bar(diana_widgets())),  # monitor 2
    ]
