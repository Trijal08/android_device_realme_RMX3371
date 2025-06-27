#! /vendor/bin/sh

getprop | sed -r 's|\[||g;s|\]||g;s|: |=|' | sed 's|ro.cold_boot_done=true||g' > /mnt/vendor/oplusreserve/runtime.prop
chown root:root /mnt/vendor/oplusreserve/runtime.prop
chmod 600 /mnt/vendor/oplusreserve/runtime.prop
sync