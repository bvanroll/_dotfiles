pacman -Sy
pacman-key --init
pacman-key --updatedb
pacman-key --populate
pacman-key --refresh-keys
echo "\n\n\n KEYS SHOULD BE FIXED, RUN pacman -Syu to verify"
