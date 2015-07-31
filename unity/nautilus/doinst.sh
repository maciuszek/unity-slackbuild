/usr/sbin/gconfpkg --uninstall nautilus

/usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas
update-desktop-database -q
gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
update-mime-database /usr/share/mime > /dev/null

