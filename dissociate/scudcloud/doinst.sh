if [ -x /usr/bin/xdg-icon-resource ]; then
  /usr/bin/xdg-icon-resource forceupdate >/dev/null 2>&1
fi

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications >/dev/null 2>&1
fi
