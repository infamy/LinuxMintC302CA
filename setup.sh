echo "Installing audio drivers and settings for C302CA Chromobook"
echo "-----------------------------------------------------------------------"
cd /lib/firmware/
echo "Downloading and installing audio firmware..."
wget https://raw.githubusercontent.com/Backpackstudio/chromebook-sentry/master/mods/lib/firmware/dfw_sst.bin -O dfw_sst.bin
md53="$(md5sum "/lib/firmware/dfw_sst.bin")"
md53="${md53%% *}"
echo "MD5 of installed audio firmware (dfw_sst.bin): ${md53}."
echo "Installing Sentry Chromobook audio hardware definitons for ALSA"
rm -d /usr/share/alsa/ucm/Google-sentry-1.0-sentry
mkdir -p /usr/share/alsa/ucm/sklnau8825max/
cd /usr/share/alsa/ucm/sklnau8825max/
echo "Downloading and installing audio configuration..."
wget https://raw.githubusercontent.com/Backpackstudio/chromebook-sentry/master/mods/usr/share/alsa/ucm/sklnau8825max/Google-sentry-1.0-sentry.conf -O Google-sentry-1.0-sentry.conf
wget https://raw.githubusercontent.com/Backpackstudio/chromebook-sentry/master/mods/usr/share/alsa/ucm/sklnau8825max/HiFi.conf -O HiFi.conf
wget https://raw.githubusercontent.com/Backpackstudio/chromebook-sentry/master/mods/usr/share/alsa/ucm/sklnau8825max/sklnau8825max.conf -O sklnau8825max.conf
ln -s /usr/share/alsa/ucm/sklnau8825max /usr/share/alsa/ucm/Google-sentry-1.0-sentry
echo "Disabling snd-hda-intel"
cd /etc/modprobe.d/
wget https://raw.githubusercontent.com/Backpackstudio/chromebook-sentry/master/mods/etc/modprobe.d/snd-hda-intel.conf -O snd-hda-intel.conf
echo
echo "Installation complete."
