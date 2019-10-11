local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'kitty',
    editor = 'atom',
    rofi = 'rofi -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi/sidebar/rofi.rasi',
    rofiappmenu = 'rofi -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi/appmenu/drun.rasi',
    lock = 'gnome-screensaver-command --lock',
    quake = 'kitty --title QuakeTerminal'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf', -- Compositor
    'blueman-applet', -- Bluetooth tray icon
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfsettingsd', -- Settings Daemon
    'nitrogen --restore', -- Reload Wallpaper
    'xrdb $HOME/.Xresources', -- X Colors
    'nm-applet', -- NetworkManager Applet
    'gnome-screensaver &' -- Screensaver
  }
}
