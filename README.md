# Installation Guide

## Networks
Use the iwd utility to connet to WiFi:

*Note: If you have an ethernet connection you can skip to the next section.*

```
~# iwctl
```

List all connected network cards:

```
[iwd]# device list 
```

Scan for available networks:

*Note: wlan0 is my card, yours might be different.*

```
[iwd]# station wlan0 scan
```

List available networks:

```
[iwd]# station wlan0 get-networks
```

Connect to your network:

```
[iwd]# station wlan0 connect YourWiFiSSID
```

After this you will be prompted to enter your password. Enter password and exit iwctl by entering:

```
[iwd]# exit
```

Check that you are online by entering:

```
~# ping google.com
```

## Partitions
### Create Partitions
List all connected drives:

```
~# lsblk
```

Use the gdisk utility to partition the drive:

*Note: This step is very important. You must target the right drive, or you risk erasing any data or operating system in another device. sda is my drive, yours might be different.*

```
~# gdisk /dev/sda
```

For this installation we will have only two partitions, the boot partition and the root partition. If you want swap or a separate home partition the procedure will be similar. Check the [arch wiki](https://wiki.archlinux.org/title/partitioning#/home) for more information.

Create a new partition. This will be the boot partition:

```
Command (? for help): n
```

Select partition number. Press enter for default:

```
Partition number (default 1): 
```

Select first sector. Press enter for default:

```
First sector (default = 2048):
```

Select last sector. This will be the size of the partition:

```
Last sector (default 240254912): +512M
```

Select partition type. The code for EFI is ef00: 

```
Hex code or GUID: ef00
```

Now create the root partition. All entries will be default:

```
Command (? for help): n
```

Save changes and exit:

```
Command (? for help): w
```

Check that all partitions are correct. Your drive should have two partitions labeled sda1 for boot and sda2 for root:

```
~# lsblk   
```

### Format Partitions
Format the boot partition:

```
~# mkfs.fat -F32 /dev/sda1
```

Format the root partition:

*Note: Format the root partition with no journaling to minimize number of writes. Instead we will store the journals in RAM.*

```
~# mkfs.ext4 -O "^has_journal" /dev/sda2
```

### Mount Partitions
Mount the root partition:

```
~# mount /dev/sda2 /mnt
```

Create a directory for the boot loader:

```
~# mkdir -p mnt/boot/efi
```

Mount the boot partition: 

```
~# mount /dev/sda1 /mnt/boot/efi
```

Check that partitions are mounted correctly:

```
~# lsblk
```

## Base System
### Install Base System
Install the base packages:

*Note: In this step we will also install a text editor. I chose nano to keep things simple. You may install whichever you are most comfortable with*

```
~# pacstrap /mnt base linux linux-firmware nano
```

Generate file system table:

```
~# genfstab -U /mnt >> /mnt/etc/fstab
```

### Enter Chroot
Before we continue, change the apparent root directory to the root partition we created:

```
~# arch-chroot /mnt
```

### Configure Time Zones 
Select your region:

*Note: My region is America, New York. Yours might be different.*

```
~# ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
```

Synchronize hardware clock and system clock:

```
~# hwclock --systohc
```

Select locale:

*Note: With this command (and any time we use nano) you will edit a configuration file. Look for your locale and uncomment it by removing the # in front of it. Once done, save and exit.*

```
~# nano /etc/locale.gen
...
#en_SG ISO-8859-1
en_US.UTF-8 UTF-8
#en_US ISO-8859-1
...
```

Generate locale:

```
~# locale-gen
```

Set system language:

*Note: The file will be empty. Enter LANG= followed by your locale. Save and exit.*

```
~# nano /etc/locale.conf

LANG=en_US.UTF-8
```

### Configure Host Info
Set host name:

*Note: The file will be empty. Enter the name you want for your machine, mine is travel. Save and exit.*

```
~# nano /etc/hostname

travel
```

Set network host:  

*Note: The file will have two commented lines. Ignore those and enter the following under them. Replace travel with your host name. Save and exit.*

```
~# nvim /etc/hosts

...
127.0.0.1  localhost 

::1        localhost

127.0.1.1  travel.localdomain travel
```

## Bootloader
Install the GRUB package and some extra tools for UEFI:

```
~# pacman -S grub efibootmgr mtools dosfstools
```

Change module loading order:

*Note: This is important when booting from a USB drive. Look for the HOOKS line and change the order as shown below. Save and exit.*

```
~# nano /etc/mkinitcpio.conf

HOOKS=(base udev block keyboard autodetect modconf filesystems fsck)
```

Regenerate inicpio:

```
~# mkinitcpio -p linux 
```

Install GRUB:

```
~# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable --recheck
```

Generate GRUB configuration file:

```
~# grub-mkconfig -o /boot/grub/grub.cfg
```

## Users and Passwords
Set root password:

*Note: You will be prompted to type a password. Type it and press enter.*

```
~# passwd
```

Create your user:

```
~# useradd -mG wheel akarez
```

Set your user password:

```
~# passwd akarez
```

Give user root privileges:

*Note: Uncomment the line shown below. This will give any user in the wheel group permisison to execute any command. Save and exit.*

```
~# EDITOR=nano visudo

...
%wheel ALL=(ALL) ALL
...
```

## Finishing Up
Install some extra packages:

```
~# pacman -S linux-headers base-devel xdg-utils xdg-user-dirs iwd bluez bluez-utils git stow
```

Enable network daemon:

```
~# systemctl enable iwd.service 
```

```
~# systemctl start iwd.service
```

Exit chroot:

```
~# exit
```

Unmount all drives:

```
~# umount -a
```

Reboot:

```
~# reboot
```

Once rebooted, login with your user name and password and connect to WiFi following the same steps as previously. Before continuing make sure you change into root:

```
~$ su
```

The next important step is to configure journaling.

Create a directory to store journals:

```
~# mkdir /etc/systemd/journald.conf.d 
```

Configure journaling file:

*Note: The file will be empty. Enter the lines shown below. Save and exit.*

```
~# nano /etc/systemd/journald.conf.d/usbstick.conf

[Journal]
Storage=volatile
RuntimeMaxUse=30M
```

## Install Desktop Environment
From here on you can chose whatever desktop environment or window manager you want to use.

If you'd like to replicate my system using the Binary Space Partitioning Window Manager (BSPWM) you can find instructions [here](https://github.com/akarez/macintosh#readme)

