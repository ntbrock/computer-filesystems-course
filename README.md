
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


	Activity: Access testing and Password Setup

### Linux Tools

ssh, bash, secure ftp, mkdir, cat, >>, less, vi, curl, hexdump -c, ln, df, mount, curl, rsync

Shell Commands From Day 1

```
pwd

cd

cd ~

cd ..

mkdir

l;s

rmdir

touch

rm 

rm -r

df 

find 

date

cat 

CTRL-C

echo

grep

vi

wc

tac

man

curl

wget

cut

history
```


### Project Research

Taylor's project need of lsyncd and encryption replication.

	Demo: Set up of the issue,  atop performance monitoring.


### Goal of Day 0

At the end of Day 0, every student should have the context of filesystems,  remote access to the svsm2019 student virutal machine, and be empowered to come up with a proposal for a project that includes a filesystem in some way:

visualization, art, gaming, networking, machine learning, performance.


### 2019Jul01 Wrap Up  Day 0

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


### Povray Notes

Animations

https://www.povray.org/documentation/view/3.6.1/108/

http://www.ms.uky.edu/~lee/visual05/povray/transspheresmovie.pov


### Python Virtual Env Notes

Installed python 3.6.3 alongside py3, plus enabled the py virtual environments.

```
$ python3.6 -V
Python 3.6.8

$ python3 -V
Python 3.7.3
```

https://linuxize.com/post/how-to-create-python-virtual-environments-on-ubuntu-18-04/

https://gist.github.com/mattseymour/08456b01c467859fba625ba5711fa08e

### Enabling Nginx User Dirs

https://websiteforstudents.com/configure-nginx-userdir-feature-on-ubuntu-16-04-lts-servers/

http://svsm.taylorbrockman.com/~brockman/


### Enable a Tensorflow AI Calculation Environment

https://www.tensorflow.org/beta/tutorials/quickstart/beginner

http://yann.lecun.com/exdb/mnist/

$ pip3 install tensorflow==1.5

Trying install from source

https://docs.bazel.build/versions/master/install-ubuntu.html

Used ubuntu instructions


## Day by Day

Day 0: Context and Provisioning

Day 1: File Contents and Networking - Pipes, Hexdump, Nginx, Rsync

Day 2: Secrets and Security - Encryption in Transport and at Rest

Day 3: Economics and the Future - Box provider, organization schemes, reactive filesytems


# Day 1  2019Jul02

Fire Drill Instructions

Network Day!

Layer 7 Model, TCP Headers, Ports, 

Nginx user directories

Vi / Nano / Emacs

Rsync, multiple hosts, SSH private/public keys

ISO's / DD's


Hexdump -c


## Gnuplot demo

https://www.lotterypost.com/thread/250775

https://stackoverflow.com/questions/14871272/plotting-using-a-csv-file

http://www.math.utk.edu/~vasili/refs/How-to/gnuplot.print.html




## Povray demo




1PM - 2PM Anne Belk Hall Room 310




## Activity Backlog

	Demo: ISO's, DD to SD cards.

	Demo: Fdisk, blocks, inodes.

### Provisioning Access

	Demo: ESXi vm setup with remote access

	Demo: Amazon EC2 , Magic Number


## Day 2 Secrets

Random Numbers

Prime Numbers

PKI - Public Key Infrastructure

	Exercise:  Generate your  id_rsa private + public key:   ssh-keygen

	ssh username@svsm2019student2

	Generate a id_rsa private + piublic key with ssh-keygen

	Clipboard copy your svsn2019student1:.ssh/id_rsa.pub and paste into student2

	cat >> ~/.ssh/authorized_keys
	<<Paste your svsm2019student1 public key>>

	Goal:    re-ssh from student1 -> student2 with a password.





Transport Layer Encryption - TLS / VPN

Encryption at Rest (PGP)

Spellbooks

SSH Public Keys

Firewalls

Git Filesystem



## Day 3

* Taylor>  Need to write a template for project summaries

Demos - Draw a card order!

### Demonstration Requirements

100% Committed, demoing from github and a terminal

README.md in Markdown that is 'documents' your project

Why? Why did you chose this?  Why is this important?

Interactive Demonstration of your Project

09:30AM Start, Randomied Order, we may have guests


### Lecture Topics

My random error in python

Neal Stephenson - In the Beginning There was the Command Line

https://www.linuxjournal.com/content/end-command-line

Rsync

dd

cksum

uuid  -> encoded

guid -> filesystem subdirectories

inodes?

vpn?

htop, atop, top

Sailing Stories and responsibilities

Self Publishing / InDesign / Illustrator


### Project List 



### Lsyncd

apt install lsyncd

https://github.com/axkibe/lsyncd

https://axkibe.github.io/lsyncd/

Deletes work too!


https://stackoverflow.com/questions/13046714/optimal-number-of-files-per-directory-vs-number-of-directories-for-ext4


```
root@svsm2019student1:~# tune2fs -l /dev/mapper/ubuntu--vg-ubuntu--lv
tune2fs 1.44.6 (5-Mar-2019)
Filesystem volume name:   <none>
Last mounted on:          /
Filesystem UUID:          ab4d9e62-2539-4c77-947b-d0777fc96acd
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
Filesystem flags:         signed_directory_hash
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              4849664
Block count:              19398656
Reserved block count:     786413
Free blocks:              17273369
Free inodes:              4712130
First block:              0
Block size:               4096
Fragment size:            4096
Group descriptor size:    64
Reserved GDT blocks:      502
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         8192
Inode blocks per group:   512
Flex block group size:    16
Filesystem created:       Sun Jun 30 16:41:51 2019
Last mount time:          Mon Jul  1 17:41:00 2019
Last write time:          Sun Jun 30 16:47:16 2019
Mount count:              3
Maximum mount count:      -1
Last checked:             Sun Jun 30 16:41:51 2019
Check interval:           0 (<none>)
Lifetime writes:          10 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          256
Required extra isize:     32
Desired extra isize:      32
Journal inode:            8
First orphan inode:       20422
Default directory hash:   half_md4
Directory Hash Seed:      4ee07f28-75b2-47b5-9d18-edd0624270b8
Journal backup:           inode blocks
Checksum type:            crc32c
Checksum:                 0xe20c7d99
```


The purity of erasure

The tao of linux

```
From: async@illuminati.io.com (Felix Sebastian Gallo)
Date: 11 Jan 1994 14:28:22 -0600

                ....  Unix, although it lends itself to enormous
monolithic processor-chowing <wax> like emacs, c++, and perl,
does not require, and should not require, their use.  The basic
Unix toolkit as shipped on the tape is remarkably expressive, and
is often the only thing needed for a given task.

If you learn the basic tools (including ed, sed, lex, yacc, awk,
cat, dd, rm, ls, mv, sh, cp, grep), then you are one with the Tao
of Unix, and you will pass through all barriers, and the wheedlings
and mewlings of your users will be as the first droplets of summer
rain on the broad shoulders of a toadstool to you.  Your power will
be spoken of across the land, and you shall not need to lap at the
rotten trough of object orientation nor the feedback of featurism.
Should you need to ride the wild stallions of perl or emacs, you
will be able to do so with a calm, confident rein rather than with
the inchoate, senseless spirit of abandon.

And many will say unto you, "you need emacs," or "it is important
that you install perl upon thy system," and your laughter will
roll as thunder, and the weak and craven will be smitten down to
cower in the rank puddles of their own ignorance.  For your hands
will fly over the keyset, yea, even when you have only a bootable
emergency disk, and with cpio and dd you will have the lever to
move the world.
```

https://en.wikipedia.org/wiki/Unix_philosophy

```
In 1994, Mike Gancarz (a member of the team that designed the X Window System), drew on his own experience with Unix, as well as discussions with fellow programmers and people in other fields who depended on Unix, to produce The UNIX Philosophy which sums it up in nine paramount precepts:

Small is beautiful.
Make each program do one thing well.
Build a prototype as soon as possible.
Choose portability over efficiency.
Store data in flat text files.
Use software leverage to your advantage.
Use shell scripts to increase leverage and portability.
Avoid captive user interfaces.
Make every program a filter.
```


Diving Coach

Verbalize Dreams

Camp Broadstone Hippie Shack




