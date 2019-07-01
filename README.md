
# Computer Filesystems Course

2019Jul01 Taylor Brockman, Content published under MIT license.

Computer Filesytems Course developed at Summer Ventures 2019



## Course Description

Big data heralds the arrival of a new knowledge backed statistical learning economy. Businesses, research organizations, and universities all exchange and catalog information using distributed cloud filesystems. Taylor will provide each of the students with an orientation into the design, implementation, and operational aspects of high volume durable computer file based storage technologies.

Keywords: Linux, Unix, Networking, Cloud, Virtualization, Encryption, Privacy, and Ethics.

Topics of study will include:

- File Input Output

- Filesystems

- Pipes and Processes

- Demonstration Projects

Mr. Taylor Brockman, Summer Ventures (1997) and NCSSM (1999) alum, Chief Technology Officer: Magic Number and Brain Power Software


## Day 0 Monday Agenda

Goal: Context and Account Provisioning

	Activity: Student Introductions, Backgrounds, Goals, Favorite Movies, Used Playing Cards to Determine Order

### Types of Computers

Legacy, Modern, Gaming, Laptop, Smartphone, Embedded, Cloud

Original, in ROM chip storage

	Demo: Raspberry Pi setup?

	Activity: Review capabilities of the workstations we have in the lab

	Activity: Github Account Creation and Password Randomization


### Types of Media

Tape, Floppy disk, Spinning Magnetic, Solid State, Hybrid, Flash, SD, USB, RAID Caching, RAID controllers, Distributed, Replicated, Cloud Block Api

	Demo: How does a magnetic hard drive work? Youtube: Seagate Content

	Activity: RAID Level Calculations  


```
Assume 10 disks

Each 1 TB per disk

RAID 0 -   10 TB -  Because no backups, splitting the data up into different disks. 

RAID 1 -  1 TB – All drives are mirrors of each other.  

RAID 5 –  9 TB - Giving data away to parity, and striping across each disk.   Creates backups.
```


### Types of Filesystems

FAT, FAT32, NTFS, Joilet, ext2, ext4, xfs, nfs

Defrag

Metadata

Journaling

https://www.howtogeek.com/howto/33552/htg-explains-which-linux-file-system-should-you-choose/


## End of Day 1

2019Jul01 Wrap Up  Day 0

1.	Disk Space needs to be increased on / [DONE]

2.	Python 3.6.6 Virtual Envriobnrment

3.	Povray needs to be installed + Tested 

4.	Gnuplot needs to be installed [DONE]

5.	Need to setup Nginx user directory hosting



```
# lvextend -L+40G /dev/ubuntu-vg/ubuntu-lv
  Size of logical volume ubuntu-vg/ubuntu-lv changed from 4.00 GiB (1024 extents) to 44.00 GiB (11264 extents).
  Logical volume ubuntu-vg/ubuntu-lv successfully resized.

# resize2fs /dev/ubuntu-vg/ubuntu-lv

```






	Demo: ISO's, DD to SD cards.

	Demo: Fdisk, blocks, inodes.

### Provisioning Access

	Demo: ESXi vm setup with remote access

	Demo: Amazon EC2 , Magic Number

	Activity: Access testing and Password Setup

### Linux Tools

ssh, bash, secure ftp, mkdir, cat, >>, less, vi, curl, hexdump -c, ln, df, mount, curl, rsync

### Project Research

Taylor's project need of lsyncd and encryption replication.

	Demo: Set up of the issue,  atop performance monitoring.


### Goal of Day 0

At the end of Day 0, every student should have the context of filesystems,  remote access to the svsm2019 student virutal machine, and be empowered to come up with a proposal for a project that includes a filesystem in some way:

visualization, art, gaming, networking, machine learning, performance.


## Day by Day

Day 0: Context and Provisioning

Day 1: File Contents and Networking - Pipes, Hexdump, Nginx, Rsync

Day 2: Secrets and Security - Encryption in Transport and at Rest

Day 3: Economics and the Future - Box provider, organization schemes, reactive filesytems



