if [ -f /usr/share/gconf/schemas/metacity.schemas ]; then
    /usr/sbin/gconfpkg --uninstall metacity
fi

glib-compile-schemas /usr/share/glib-2.0/schemas
