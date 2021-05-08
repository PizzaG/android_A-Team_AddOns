
sleep 300
su -c rm -r data/adb/post-fs-data.d/PostBootSetup.sh
su -c rm -r data/adb/post-fs-data.d/CleanUp.sh
su -c rm -r cache/recovery/openrecoveryscript
su -c rm -r cache/Busybox.zip
su -c rm -r cache/Magisk.apk
su -c rm -r cache/Magisk.zip
exit
