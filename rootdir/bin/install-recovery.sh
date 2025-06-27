#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0e19cfce05958cf85b3b057f19825cd56141ff72; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:2d02c8123aa1bbe67c11bc3a5002f4ea06491ca4 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0e19cfce05958cf85b3b057f19825cd56141ff72 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
