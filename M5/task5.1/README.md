------------------- 13 ------------------------
Example of devices

$ ls -l /dev

brw-rw----   1 root disk      8,   0 Dec 20 20:13 sda

crw-rw-rw-   1 root root      1,   3 Dec 20 20:13 null

srw-rw-rw-   1 root root           0 Dec 20 20:13 log

prw-r--r--   1 root root           0 Dec 20 20:13 fdata


c - character
b - block
p - pipe
s - socket

Info about devices

lsusb 
lspci 
lsscsi

----------------- 14 -----------------------
Type of file system 

- ext2
- ext3
- ext4
- jfs
- ReiserFS
- XFS
- Btrfs


How determine file system 

- lsblk -f
- df -Th

----------------- 15 --------------------

ls -lth | grep ^d| head -n 5









