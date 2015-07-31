gio-querymodules /usr/lib/gio/modules

# This service must be enabled to avoid issues with Unity
systemctl enable bamfwatcher.service
systemctl start bamfwatcher.service

