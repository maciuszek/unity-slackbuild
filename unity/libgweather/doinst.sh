if [ -f /usr/share/gconf/schemas/libgweather.schemas ]; then
  gconfpkg --uninstall libgweather
fi

gtk-update-icon-cache -q -t -f /usr/share/icons/gnome
glib-compile-schemas /usr/share/glib-2.0/schemas
