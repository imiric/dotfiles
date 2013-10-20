#
# ~/.config/subtle/subtle.rb
#
# === Subtle Configuration ===


# == Options ==

set :increase_step,      5
set :border_snap,        10
set :default_gravity,    :center
set :urgent_dialogs,     false
set :honor_size_hints,   false
set :gravity_tiling,     false
set :click_to_focus,     false
set :skip_pointer_warp,  false
set :skip_urgent_warp,   false


# == Screens ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Multihead
#     http://subforge.org/projects/subtle/wiki/Panel

screen 1 do
  top   [ ]
  bottom      [ :views, :title, :spacer, :keychain, :separator, :tray, :cpu,
                :battery, :wifi, :volume, :separator, :clock]
end


# == Styles ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Styles

# colors
background      =  "#1c1c1c"
client_active   =  "#1c1c1c"
client_inactive =  "#a8a8a8"
focus_bg        =  "#0087af"
focus_fg        =  "#e5e5e5"
focus_ic        =  "#808080"
occupied_bg     =  "#3a3a3a"
occupied_fg     =  "#358bde"
occupied_ic     =  "#358bde"
panel_bottom    =  "#1c1c1c"
panel_top       =  "#1c1c1c"
separator_bg    =  "#1c1c1c"
separator_fg    =  "#b0b0b0"
stipple         =  "#757575"
sublets_bg      =  "#1c1c1c"
sublets_fg      =  "#808080"
sublets_ic      =  "#808080"
title_bg        =  "#1c1c1c"
title_fg        =  "#808080"
urgent_bg       =  "#519f50"
urgent_fg       =  "#ffffff"
urgent_ic       =  "#ffffff"
views_bg        =  "#1c1c1c"
views_bo        =  "#b0b0b0"
views_fg        =  "#808080"
views_ic        =  "#808080"

# all panel objects
style :all do
  padding     2, 4, 2
  font        "xft:terminus-8:antialias=true"
end

# views
style :views do
  background    views_bg
  foreground    views_fg
  icon          views_ic
  padding       1, 8
  border_right  views_bo, 1

  style :focus do
    foreground  focus_fg
    background  focus_bg
    icon        focus_ic
  end

  style :urgent do
    foreground  urgent_fg
    background  urgent_bg
    icon        urgent_ic
  end

  style :occupied do
    foreground  occupied_fg
    background  occupied_bg
    icon        occupied_ic
  end
end

# sublets
style :sublets do
  foreground  sublets_fg
  background  sublets_bg
  icon        sublets_ic
end

style :separator do
  foreground  separator_fg
  background  separator_bg
  separator   "|"
end

# title
style :title do
  foreground  title_fg
  background  title_bg
end

# clients
style :clients do
  active    client_active, 0
  inactive  client_inactive, 0
  width     30
  border    views_bo, 0
  margin_bottom 3
end

# body
style :subtle do
  margin      0
  panel       panel_top
end


# == Gravities ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Gravity

# top left
gravity :top_left,        [   0,   0,  50,  50 ]
gravity :top_left66,      [   0,   0,  50,  66 ]
gravity :top_left33,      [   0,   0,  50,  34 ]

# top
gravity :top,             [   0,   0, 100,  50 ]
gravity :top66,           [   0,   0, 100,  66 ]
gravity :top33,           [   0,   0, 100,  34 ]

# top right
gravity :top_right,       [  50,   0,  50,  50 ]
gravity :top_right66,     [  50,   0,  50,  66 ]
gravity :top_right33,     [  50,   0,  50,  33 ]

# left
gravity :left,            [   0,   0,  50, 100 ]
gravity :left66,          [   0,   0,  66, 100 ]
gravity :left33,          [   0,   0,  33, 100 ]

# center
gravity :center,          [   0,   0, 100, 100 ]
gravity :center66,        [  17,  17,  66,  66 ]
gravity :center33,        [  33,  33,  33,  33 ]

# right
gravity :right,           [  50,   0,  50, 100 ]
gravity :right66,         [  34,   0,  66, 100 ]
gravity :right33,         [  67,  50,  33, 100 ]

# bottom left
gravity :bottom_left,     [   0,  50,  50,  50 ]
gravity :bottom_left66,   [   0,  34,  50,  66 ]
gravity :bottom_left33,   [   0,  67,  50,  33 ]

# bottom
gravity :bottom,          [   0,  50, 100,  50 ]
gravity :bottom66,        [   0,  34, 100,  66 ]
gravity :bottom33,        [   0,  67, 100,  33 ]

# bottom right
gravity :bottom_right,    [  50,  50,  50,  50 ]
gravity :bottom_right66,  [  50,  34,  50,  66 ]
gravity :bottom_right33,  [  50,  67,  50,  33 ]

# gimp
gravity :gimp_image,      [  10,   0,  80, 100 ]
gravity :gimp_toolbox,    [   0,   0,  10, 100 ]
gravity :gimp_dock,       [  90,   0,  10, 100 ]


# == Grabs ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Grabs

mod1 = "M-"
mod2 = "W-"

# views
viewnum = 1..7
viewnum.each do |k|
  grab "#{mod1}#{k}",    "ViewSwitch#{k}".to_sym
  grab "#{mod1}S-#{k}",  "ViewJump#{k}".to_sym
  grab "#{mod1}A-#{k}",  "ScreenJump#{k}".to_sym
end

grab "#{mod1}F12",  :ViewNext
grab "#{mod1}F11",  :ViewPrev

# reload/restart
#grab "#{mod1}C-r",    :SubtleReload
# check syntax
grab "#{mod1}S-r",  <<SCRIPT
subtle -k &>/dev/null
reload=$?

if [[ $reload -ne 0 ]] ; then
  xmessage 'Syntax error, reload anyway?' -center -buttons NO:1,YES:0
  reload=$?
fi

[[ $reload -eq 0 ]] && subtler -r
SCRIPT

grab "#{mod1}C-S-r",  :SubtleRestart
grab "#{mod1}C-q",    :SubtleQuit

# windows
grab "A-B1",          :WindowMove
grab "A-B3",          :WindowResize
grab "#{mod2}f",      :WindowFloat
grab "#{mod2}Return", :WindowFull
grab "#{mod2}minus",  :WindowStick
grab "#{mod2}equal",  :WindowZaphod
grab "#{mod2}u",      :WindowRaise
grab "#{mod2}i",      :WindowLower
grab "#{mod2}h",      :WindowLeft
grab "#{mod2}Left",   :WindowLeft
grab "#{mod2}j",      :WindowDown
grab "#{mod2}Down",   :WindowDown
grab "#{mod2}k",      :WindowUp
grab "#{mod2}Up",     :WindowUp
grab "#{mod2}l",      :WindowRight
grab "#{mod2}Right",  :WindowRight
grab "#{mod2}S-k",    :WindowKill
grab "#{mod1}w",      :WindowKill

grab "A-Tab" do
  clients = Subtlext::Client.visible
  clients.last.instance_eval do
    focus
    raise
  end
end

grab "A-S-Tab" do
  clients = Subtlext::Client.visible
  clients.first.instance_eval do
    lower
  end
  clients.first.instance_eval do
    focus
  end
end

# gravities

gravkeys = { "q" => [ :top_left,     :top_left66,     :top_left33     ],
             "w" => [ :top,          :top66,          :top33          ],
             "e" => [ :top_right,    :top_right66,    :top_right33    ],
             "a" => [ :left,         :left66,         :left33         ],
             "s" => [ :center,       :center66,       :center33       ],
             "d" => [ :right,        :right66,        :right33        ],
             "z" => [ :bottom_left,  :bottom_left66,  :bottom_left33  ],
             "x" => [ :bottom,       :bottom66,       :bottom33       ],
             "c" => [ :bottom_right, :bottom_right66, :bottom_right33 ], }
gravkeys.each do |k, v|
  grab "#{mod2}#{k}", v
end

# commands
grab "#{mod1}Return",  "urxvtc"
grab "#{mod1}e",       "pcmanfm"
grab "#{mod1}r",       "dmenu_run -fn 'Terminus-8'"

# media keys
grab "XF86AudioMute",         :VolumeToggle
grab "XF86AudioLowerVolume",  :VolumeLower
grab "XF86AudioRaiseVolume",  :VolumeRaise
grab "XF86AudioPrev",         "echo -n '+' > ~/.config/pianobar/ctl"
grab "XF86AudioPlay",         "echo -n 'p' > ~/.config/pianobar/ctl"
grab "XF86AudioNext",         "echo -n 'n' > ~/.config/pianobar/ctl"


# == Tags ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Tagging

tag "term" do
  match    :instance => "xterm|[u]?rxvt[c]?"
  #gravity  :center66
  resize   false
end

tag "browser" do
  match   "uzbl.*|(google-)?chrom[e|ium]|firefox"
  resize  true
end

tag "torrent" do
  match   "transmission.*"
  resize  true
end

tag "file" do
  match   :instance => "pcmanfm"
  resize  true
end

tag "video" do
  match  "mplayer.*"
  float  true
end

tag "audio" do
  match   :instance => "pianobar"
  resize  true
end

tag "images" do
  match  "feh"
  float  true
end

tag "render" do
  match   "devede"
  resize  true
end
tag "editor" do
  match   :instance => "[g]?vim"
  resize  true
end

tag "viewer" do
  match   :instance => "[g]?view|zathura"
  resize  true
end

tag "gimp_image" do
  match    :role => "gimp-image-window"
  gravity  :gimp_image
end

tag "gimp_toolbox" do
  match    :role => "gimp-toolbox$"
  gravity  :gimp_toolbox
end

tag "gimp_dock" do
  match    :role => "gimp-dock"
  gravity  :gimp_dock
end

tag "stick" do
  match   "display|exe|gcolor2|xmessage|<unknown>"
  stick   true
  float   true
  resize  true
end


# == Views ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Views

# tags
dev   = "editor|viewer"
files = "file"
gimp  = "gimp_.*"
media = "video|audio|images|render"
misc  = "default"
web   = "browser|torrent"
term = "term"

# icons
iconpath = "#{ENV["HOME"]}/.icons"

view "term" do
  match      term
  #icon       Subtlext::Icon.new("#{iconpath}/arch2.xbm")
  #icon_only  true
end

view "web" do
  match      web
  #icon       Subtlext::Icon.new("#{iconpath}/world.xbm")
  #icon_only  true
end

view "dev" do
  match      dev
  #icon       Subtlext::Icon.new("#{iconpath}/pencil.xbm")
  #icon_only  true
end

view "files" do
  match      files
  #icon       Subtlext::Icon.new("#{iconpath}/file2.xbm")
  #icon_only  true
end

#view "media" do
  #match      media
  ##icon       Subtlext::Icon.new("#{iconpath}/movie.xbm")
  ##icon_only  true
#end

view "misc" do
  match      misc
  #icon       Subtlext::Icon.new("#{iconpath}/bag.xbm")
  #icon_only  true
end

#view "gimp" do
  #match      gimp
  ##icon       Subtlext::Icon.new("#{iconpath}/paint.xbm")
  ##icon_only  true
#end


# == Sublets ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Sublets

sublet :clock do
  format_string  "%a, %b %d, %Y  %l:%M%P"
  interval       20
end

sublet :volume do
  step  2
end

sublet :cpu do
  interval  2
end

sublet :wifi do
  device  "wlp7s0"
end

sublet :weather_mod do
  day_color   views_fg
  temp_color  views_bo
  sep_color   separator_fg
  interval    3600
  location    "93612"
  sep         ":"
end


# == Hooks ==
# -- links:
#     http://subforge.org/projects/subtle/wiki/Hooks

#[ "chromium", "urxvtc", "xrun -p vim --servername vim", "conky -c '#{ENV["HOME"]}/.conkyrc'" ].each do |p|
#  on :start do
#    Subtlext::Subtle.spawn  p
#  end
#end
