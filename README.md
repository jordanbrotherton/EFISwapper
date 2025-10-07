<img src="./icons/win.svg" alt="Adwaita-Styled Windows Logo" width="128"/>

# EFISwapper
A helper script to better dual-boot Linux and Windows. 

> [!NOTE]  
> Currently only the Linux-side shortcut creator is finished. The Windows-side shortcut will be made very soon!

## Compatibility
This script should work on most Linux distros that has efibootmgr installed and modern versions of Windows. It will only work on systems with compliant EFIs since this directly edits the order of boot entries. This has been personally tested with Fedora and Windows 11 on a ThinkPad X1 Extreme Gen 2 and an HP-TG01.

## Installation
Simply run the script on each OS and it will create the shortcut needed to boot into the other OS.

## Why use this?
GRUB and other bootloaders handle the switching on boot-time, often defaulting to your installed distro. This can lead to annoyances especially when using Windows, which is reboot-prone. Windows also has been reported to insert itself as the default on some systems. This script avoids that by setting each OS as the default, meaning that each reboot will boot into that OS until you swap. This allows for reboot-heavy tasks to be achieved unattended.

Additionally, since it will default to the specific OS' bootloader, it will take advantage of its features. That means if you're on Windows, it should have fast boot and that if you're on Linux, you can take advantage of lighter bootloaders and flicker-free bootloaders.

This script can also help make dual-booting devices which have non-standard input methods easier, such as handheld consoles or tablets. This is due to it being handled in the environment where those unique controls are most accessible.
