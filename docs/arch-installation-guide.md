# Arch Linux installation guide

> This arch installation guide is customized for my needs

## Set font and font-size

I use en_US keyboard layaout so I don't need to set it.

```sh
setfont /usr/share/kbd/consolefonts/ter-c24b.psf.gz
```

Verify if you have internet connection:

```sh
ping google.com
```

## Connect to internet

if you do not have internet connection you can run:

```sh
iwctl

device list
```

```
# output;
# You should see something like this:
#
#                            Devices
# -------------------------------------------------------------
#   Name          Address          Powered    Adapter    Mode
# -------------------------------------------------------------
#   wlan0         ...              on         ...        ...

[iwd]# station YOURDEVICE connect YOURSSID
```

list your partitions:

```sh
fdisk -l

# also:

lsblk
```

## Make your partitions

Use `cfdisk`

### Disclaimer

> This guide is for BIOS users if you're UEFI user the partitioning disk is kind of different

Once you run `cfdisk /dev/yourpartition` for example `cfdisk /dev/sda`

You need to select `dos` and create 3 partitions

1. Linux swap -> type Linux swap solaris and bootable
2. root: /
3. home: /home

## Format the partitions

Format the swap partition:

Notice X is the disk number

```sh
mkswap /dev/sdaX
swapon /dev/sdaX
```

Format the root and home partitions as ext4:

```sh
# root:
mkfs.ext4 /dev/sdaX

# home:
mkfs.ext4 /dev/sdaX
```

## Mount the partitions

Mount the root partitions:

```sh
mount /dev/sdaX /mnt
```

Mount the home partitions:

```sh
mkdir /mnt/home
mount /dev/sdaX /mnt/home
```

Mount windows partitions

```sh
mkdir /mnt/windowsX
mount /dev/sdaX /mnt/windowsX
```

## Edit your mirrorlist file

```sh
pacman -Syy

pacman -S reflector

# I use Brazil cause Brazil is the
reflector -c Brazil -a 6 --sort rate --save /etc/pacman.d/mirrorlist
```

## Install the main dependencies:

```sh
pacstrap /mnt linux linux-firmware base base-devel sudo vim nerworkmanager pacman git wget ntfs-3g

```

## Configure the system

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

## last steps for the Installations

```sh
arch-chroot /mnt
```

## Setting up Time zone

```sh
ln -sf /usr/share/zoneinfo/America/La_Paz /etc/localtime

hwclock --systohc
```

## Setting up localization

```sh
echo 'en_US.UTF-8 UTF-8
es_BO.UTF-8 UTF-8' >> /etc/locale.gen


echo 'LANG=en_US.UTF-8
LC_ADDRESS=es_BO.UTF-8
LC_IDENTIFICATION=es_BO.UTF-8
LC_MEASUREMENT=es_BO.UTF-8
LC_MONETARY=es_BO.UTF-8
LC_NAME=es_BO.UTF-8
LC_NUMERIC=es_BO.UTF-8
LC_PAPER=es_BO.UTF-8
LC_TELEPHONE=es_BO.UTF-8
LC_TIME=es_BO.UTF-8' >> /etc/locale.conf

locale-gen
```

## setting keymaps

```sh
echo 'KEYMAP=us
FONT=default8x16
FONT_MAP=8859-2' >> /etc/vconsole.conf
```

## Setting hosts

Firstly setting the hostname:

```sh
# echo 'yourhostname' >> /etc/hostname
echo 'archzone' >> /etc/hostname
```

Now setting up the hosts

```sh
echo '# Standard host addresses
127.0.0.1  localhost
::1        localhost ip6-localhost ip6-loopback
ff02::1    ip6-allnodes
ff02::2    ip6-allrouters
# This host address
127.0.1.1  archzone' >> /etc/hosts
```

## Enabling the internet

Very important

```sh
systemctl enable NetworkManager
```

## Creating new user

```sh
useradd -m -G wheel erick
passwd erick
```

now run:

```sh
EDITOR=vim visudo
```

and uncomment the line:

```
%wheel ALL=(ALL) ALL
```

## Installing some important packages

```sh
pacman -Sy
pacman -S intel-ucode linux-headers grub os-prober openssh neofetch xf86-video-intel
```

## Setting up the grub

````sh
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
sudo vim /etc/default/grub
```

Uncomment the next line:

> GRUB_DISABLE_OS_PROBER=false

## Finishing the bare Arch linux OS

```sh
mkinitcpio -P
exit
umount -R /mnt

sudo nano /etc/grub.d/40_custom
# Add this:
#   menuentry "Windows 10" {
#       set root='(hd0,1)'
#       chainloader +1
#   }

reboot
````




## connect to internet

```sh
nmcli device wifi connect MyWiFi password mypassword
```

## Installing and setting up python and pip

```sh
sudo pacman -S python3 python3-pip
sudo rm -rf /usr/lib/python3.x/EXTERNALLY-MANAGED
```

## Setting up the desktop environment

Installing Window Manager and Display manager

```sh
sudo pacman -S qtile ly xorg
sudo systemctl enable ly
```

Installing some packages:

```sh
pip3 install -r ~/.config/qtile/requeriments.txt
```

now reboot your computer: `sudo reboot`

## Setting up Git

```sh
./git_setup.sh 'your_username' 'your_email@gmail.com'
```

Then when the next time you'll make a `git push` run the next command before

> You need to have a git token and enter it into the `password` field

```sh
git config --global credential.helper store
git push
```

## Installing Paru (binary) Aur helper

```sh
git clone https://aur.archlinux.org/paru-bin.git
cd paru
makepkg -si
```

## Settig up ZSH Shell

```sh
sudo pacman -S zsh
paru -S zsh-syntax-highlighting  zsh-autosuggestions

sudo su

usermod --shell /usr/bin/zsh 'username'

# Installing powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

## Making visible password

add this: `Defaults env_reset,pwfeedback,insults` into: `/etc/sudoers`

Missing packages:

- ksuperkey
- betterlockscreen
