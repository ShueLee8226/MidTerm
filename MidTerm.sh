#!/bin/bash

clear
echo "Welcome to my midterm script"
echo "In this script I will put all my script together"

sleep 3
clear
echo "This is Week2 script"
echo "Let review the basic of linux script"
echo "Let check which working directory are we on and what directory are there?"
pwd
sleep 1
ls -l
sleep 5

echo "Now let create a file call Hello.txt"
touch Hello.txt
echo "Next let create a Direcotry call World"
mkdir World
echo "let check them"
ls

sleep 2
echo "Now let copy Hello.txt and make Hello2.txt"
cp Hello.txt Hello2.txt
ls
echo "Now let move the two file into the Directory World"
mv Hello.txt World
mv Hello2.txt World
ls
sleep 3
cd World/
pwd
ls
sleep 3

echo "Now let cat a file and sort them In the File Hello.txt"
echo "This is simple 1" >> Hello.txt
echo "Coconut" >> Hello.txt
echo "Apple" >> Hello.txt
echo "Banana" >> Hello.txt
cat Hello.txt
echo "Now sort them"
echo "==================="
sort Hello.txt
sleep 2
echo "1" >> Hello2.txt
echo "2" >> Hello2.txt
echo "3" >> Hello2.txt
echo "Now let check what diffent inside Hello.txt and Hello2.txt"
diff Hello.txt Hello2.txt

rm Hello.txt Hello2.txt
cd ..
rmdir World


clear
echo "This is Week3 script"
echo "Week3 is about Device"
echo "First let change into dev bin some device in there"
cd /dev
ls -l | head
echo "Here is a example of a device that ignores the input and throw"; echo "away the data"
echo hello world > /dev/null
echo "let see  the kernel messages and the block device file system"
dmesg | grep sd
sleep 2
lsblk --fs
echo "now let create a empty file"
sudo dd if=/dev/zero of=./New_File bs=1M count=1
hexdump New_File


clear
echo "This is Week4 Script"
echo "First let check what in the partition table"
fdisk -l
echo "Now let create a partition that is 16MB.img"
sudo dd if=/dev/zero of=./16MB.img bs=1M count=16
sudo hexdump ./16MB.img | less
echo "Now let make a filesystem that is ext4"
sudo mkfs -t ext4 ./16MB.img
echo "let check other filesystem"
ls -l /sbin/mkfs.*
sleep 3
echo "now let mount the partition that we created"
mkdir /mnt/tmp
sudo mount ./16MB.img /mnt/tmp
sudo mount; df -h
lsblk
sleep 1
echo "Ok, now let put something in the partition"
cd /mnt/tmp
ls
sleep 3
echo "Week4 script" > ./world.txt
#unmount the partition
sudo umount /mnt/tmp
echo "Let check for world.txt in the partition that we create" 
sudo hexdump --canonical ./16MB.img | less

clear
echo "This is Week5 and 6 script"
echo "Let look at the kernel log"
sleep 2
less /var/log/kern.log | head
less /var/log/messages | tail
sleep 3

clear
echo "Now let check the kernel Boot parameters"
cat /proc/cmdline
echo "let take a look at the grub"
cd /boot
ls
sleep 2
cd grub/
ls -l
sleep 2
less grub.cfg | head
less grub.cfg | tail
sleep 4

echo "Now let look at the manual page for grub install"
man grub-mkconfig | head
sleep 1
echo "Now let install grub into a device"
grub-install /dev/sda

clear
echo "This is script 7"
echo "let check our runlevel"
runlevel
echo "Now let check it again with the date and time we access to the runlevel"
who -r
sleep 2
echo "Let find our init system"
ls /usr/lib/systemd /etc/systemd/ | head
ls ls /etc/init | head
sleep 3

echo "Let check some list unit"
sudo systemctl list-units | head
sleep 2
echo "Let see our systemd configuration location"
sudo systemctl -p UnitPath show
sleep 3
echo "let check the dependencies units list"
sudo systemctl list-dependencies | head
