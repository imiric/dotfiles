from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget.wlan import Wlan
import os

alt = "mod1"
mod = "mod3"
sup = "mod4"

# Widgets Theme
widget_defaults = dict(
                    background="#15181a",
                    opacity=0.9,
                    border_color="#222222",
                    fontshadow="#000000",
                    font = 'Terminus',
                    fontsize=12,
                )

groupbox_defaults = dict(
                        padding=3,
                        margin_x=2,
                        margin_y=2,
                        borderwidth=2
                    )
groupbox_defaults.update(widget_defaults)

keys = [
    Key([mod], "w", lazy.window.kill()),
    Key([mod], "r", lazy.spawncmd()),

    # App launchers
    Key([mod], "Return", lazy.spawn("urxvtc")),
    Key([mod], "e", lazy.spawn('pcmanfm')),

    # windows style alt-tab/alt-shift-tab
    Key([alt], "Tab", lazy.layout.down()),
    Key([alt, "shift"], "Tab", lazy.layout.up()),

    # Layouts
    Key([alt], "space", lazy.nextlayout()),
    Key([alt], "Return", lazy.window.toggle_floating()),

    # Bindings for Stack layout
    Key( [alt, "shift"], "space", lazy.layout.rotate()),
    Key( [alt, "shift"], "Return", lazy.layout.toggle_split()),

    # Bindings for MonadTall layout
    Key([alt, "shift"], "k", lazy.layout.shuffle_down()),
    Key([alt, "shift"], "j", lazy.layout.shuffle_up()),
    Key([alt], "i", lazy.layout.grow()),
    Key([alt], "m", lazy.layout.shrink()),
    Key([alt], "n", lazy.layout.normalize()),
    Key([alt], "o", lazy.layout.maximize()),
    Key([alt, "shift"], "space", lazy.layout.flip()),

    # Bindings for Tile layout
    Key([alt, "shift"], "i", lazy.layout.increase_ratio()),
    Key([alt, "shift"], "d", lazy.layout.decrease_ratio()),

    # Sound
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 5%+")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 5%-")),
    Key([], "XF86AudioMute",
        lazy.spawn("amixer sset Master toggle")),

    # Qtile management
    Key([alt, "shift"], "r", lazy.restart()),
    Key([alt, "shift"], "q", lazy.shutdown()),

    # cycle to previous group
    Key([mod], "F11", lazy.screen.prevgroup(skip_managed=True)),
    # cycle to next group
    Key([mod], "F12", lazy.screen.nextgroup(skip_managed=True)),
    # toggle group
    Key([mod], "Tab", lazy.screen.togglegroup()),

    # PRINT SCREEN
    Key([mod], "F10", lazy.spawn("import -window root ~/screenshot.png")),
]

groups = [
    Group("term"),
    Group("work"),
    Group("web"),
    Group("play"),
    Group("misc"),
]
for i, g in enumerate(groups, 1):
    # mod + group number = switch to group
    keys.append(
        Key([mod], str(i), lazy.group[g.name].toscreen())
    )

    # mod + shift + group number = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], str(i), lazy.window.togroup(g.name))
    )

# This allows you to drag windows around with the mouse if you want.
mouse = [
            Drag([mod], "Button1", lazy.window.set_position_floating(),
                         start=lazy.window.get_position()),
            Drag([mod], "Button3", lazy.window.set_size_floating(),
                         start=lazy.window.get_size()),
            Click([mod], "Button2", lazy.window.bring_to_front())
]

layouts = [
    layout.Max(),
    #layout.MonadTall(
    #    border_focus="#005F0C",
    #    border_normal="#555555"
    #),
    # a layout for the Freshbooks timer
    layout.Slice('right', 256, name='freshbooks',
                    wmname='*Timer*', role='pop-up'),

    layout.Stack(stacks=2),

    # a layout for pidgin
    #layout.Slice('right', 256, name='pidgin', role='buddy_list',
    #     fallback=layout.Stack(stacks=2, border_width=1)),
    #layout.Tile(ratio=0.35, borderwidth=1),

    ## a layout just for gimp(stolen from tych0's config)
    #layout.Slice('left', 192, name='gimp', role='gimp-toolbox',
    #     fallback=layout.Slice('right', 256, role='gimp-dock',
    #     fallback=layout.Stack(stacks=1))),
]

screens = [
    Screen(
        bottom = bar.Bar([
                widget.GroupBox(**groupbox_defaults),
                #widget.WindowName(**widget_defaults),
                widget.Sep(),
                widget.TaskList(borderwidth=0, padding=2,
                    margin_y=2, rounded=False, highlight_method="block"),
                widget.Prompt(**widget_defaults),
                widget.Sep(),

                # system usage
                widget.CPUGraph(width=60, line_width=1,
                    graph_color='FF2020', fill_color='C01010'),
                widget.MemoryGraph(samples=50, line_width=1, width=60,
                                   graph_color='0066FF',
                                   fill_color='001188'),
                widget.NetGraph(samples=50, line_width=1,
                                width=60, interface="wlp7s0",
                                graph_color='22FF44',
                                fill_color='11AA11'),

                widget.ThermalSensor(tag_sensor='Core 2'),

                widget.BatteryIcon(energy_now_file='charge_now',
                    energy_full_file='charge_full',
                    battery_name='BAT1',
                    power_now_file='current_now',
                    theme_path='/usr/share/icons/Faenza-Dark/status/22',
                    **widget_defaults
                ),

                Wlan(interface='wlp7s0'),

                widget.Volume(update_interval=0.2, theme_path=\
                        '/usr/share/icons/Faenza-Dark/status/22/'),

                widget.Systray(icon_size=14),
                widget.Clock('%Y-%m-%d %a %I:%M %p', fontsize=12),
            ],
            size=20, opacity=0.9),
    ),
]


def show_shortcuts():
    key_map = {"mod1": "alt", "mod4": "super"}
    shortcuts_path = "{0}/{1}".format(os.environ["HOME"], "qtile_shortcuts")
    shortcuts = open("{0}".format(shortcuts_path), 'w')
    shortcuts.write("{0:30}| {1:50}\n".format("KEYS COMBINATION", "COMMAND"))
    shortcuts.write("{0:80}\n".format("=" * 80))
    for key in keys:
        key_comb = ""
        for modifier in key.modifiers:
            key_comb += key_map.get(modifier, modifier) + "+"
        key_comb += key.key
        shortcuts.write("{0:30}| ".format(key_comb))
        cmd_str = ""
        for command in key.commands:
            cmd_str += command.name + " "
            for arg in command.args:
                cmd_str += "{0} ".format(repr(arg))
        shortcuts.write("{0:50}\n".format(cmd_str))
        shortcuts.write("{0:80}\n".format("-" * 80))
    shortcuts.close()
    return lazy.spawn("xterm -wf -e less {0}".format(shortcuts_path))


def window_sorter(win):
    patterns = (
        ('Gajim', 'Messaging'),
        ('XChat', 'Messaging'),
        ('Icedove', 'Messaging'),
        ('pidgin', 'Messaging'),
        ('Vimperator', 'Util'),
        ('Krusader', 'Util'),
        ('playout', 'Work'),
        ('lifia', 'Work'),
        )
    for k, v in patterns:
        if k in win.name:
            return v
    return 'Other'


@hook.subscribe.client_new
def dialogs(window):
    if(window.window.get_wm_type() == 'dialog'
        or window.window.get_wm_transient_for()):
        window.floating = True

# More shortcuts
keys.append(Key([alt], "r", lazy.layout.sort_windows(window_sorter)))
keys.append(Key([mod], "F1", show_shortcuts()))
keys.append(Key([sup], "l", lazy.spawn("xscreensaver-command -lock")))

# Automatically float these types. This overrides the default behavior (which
# is to also float utility types), but the default behavior breaks our fancy
# gimp slice layout specified later on.
floating_layout = layout.Floating(auto_float_types=[
  "notification",
  "toolbar",
  "splash",
  "dialog",
])

main = None
follow_mouse_focus = True
cursor_warp = False
mouse = ()
