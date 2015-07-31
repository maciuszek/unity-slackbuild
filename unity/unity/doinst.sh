glib-compile-schemas /usr/share/glib-2.0/schemas
if [ -x $(which gtk-update-icon-cache) ]; then
  gtk-update-icon-cache -q -t -f /usr/share/ccsm/icons/hicolor/
fi

