#!/bin/sh
# EFISwapper - Linux Portion
# Reboot to Windows
clear

if [[ -z $(command -v efibootmgr) ]]; then
    echo "Could not find efibootmgr! Please install efibootmgr and verify that your system uses EFI."
    exit 1
fi

# Set up boot command.
echo "Setting up boot command..."

WINDOWS=$(efibootmgr |  grep -m 1 "Windows Boot Manager" | awk '{print $1}' | grep -o '[0-9]\+')
if [[ -z $WINDOWS ]]; then
    echo "Could not find Windows Boot Manager! Leaving..."
    exit 1
fi

BOOTORDER=$(efibootmgr |  grep "BootOrder:" | awk '{print $2}')
FIRSTENTRY=$(echo $BOOTORDER | cut -d ',' -f 1)

BOOTORDER=$(echo $BOOTORDER | sed "s/$FIRSTENTRY/WIN/g")
BOOTORDER=$(echo $BOOTORDER | sed "s/$WINDOWS/NIX/g")

BOOTORDER=$(echo $BOOTORDER | sed "s/WIN/$WINDOWS/g")
BOOTORDER=$(echo $BOOTORDER | sed "s/NIX/$FIRSTENTRY/g")

BOOTCOMMAND="pkexec efibootmgr -o $BOOTORDER"

# Create boot script.
echo "Creating boot script..."
mkdir -p "$HOME/.local/bin"
printf "#!/bin/sh\n$BOOTCOMMAND\nreboot" > "$HOME/.local/bin/winboot"
chmod +x "$HOME/.local/bin/winboot"

# Install shortcut.
echo "Installing shortcut..."
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/share/icons"
cp "./reboot-to-windows.desktop" "$HOME/.local/share/applications/"
cp "./icons/win.svg" "$HOME/.local/share/icons/"

sed -i "s|HOME|$HOME|g" $HOME/.local/share/applications/reboot-to-windows.desktop

echo "Done! Find 'Reboot to Windows' in your app list!"
