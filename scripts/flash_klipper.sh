#!/bin/bash
sudo service klipper stop
cd ~/klipper

# Flash MCU (Spider)
make clean KCONFIG_CONFIG=config.e3v2
make menuconfig KCONFIG_CONFIG=config.e3v2
make KCONFIG_CONFIG=config.e3v2
read -p "SKR Mini E3v2 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f103xe_36FFD7055359393505762143-if00 btt-skr-mini-e3-v2
read -p "SKR Mini E3v2 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

# Flash MCU (Linux)
make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=config.rpi
read -p "RPi firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

# Flash MCU (Expander)
# make clean KCONFIG_CONFIG=config.expander
# make menuconfig KCONFIG_CONFIG=config.expander
# make KCONFIG_CONFIG=config.expander
# read -p "Expander firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# make flash KCONFIG_CONFIG=config.expander FLASH_DEVICE=0483:df11
# read -p "Expander firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

# Flash MCU (Display)
# make clean KCONFIG_CONFIG=config.display
# make menuconfig KCONFIG_CONFIG=config.display
# make KCONFIG_CONFIG=config.display
# read -p "Display firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# make flash KCONFIG_CONFIG=config.display FLASH_DEVICE=0483:df11
# read -p "Display firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

sudo service klipper start