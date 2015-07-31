glib-compile-schemas /usr/share/glib-2.0/schemas
getent group colord >/dev/null || groupadd -g 124 colord
getent passwd colord >/dev/null || useradd -d /var/lib/colord -u 124 -g colord -s /bin/false colord
chown colord:colord /var/lib/colord
chown colord:colord /var/lib/colord/*.db 2>/dev/null || return 0
