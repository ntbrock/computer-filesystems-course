# Using Lsyncd to Repliciate Filesystems Automatically  

Taylor Brockman 

July 5, 2019

## Why

Professionally, I use a clustered multi-computer approach for serving my secure application content to users via the web.  Storing many copies of the data provides for greater performance because each web traffic node can read the data from its local filesystem and greater stabilitiy because if a single node is removed from the cluster, each node has a fully copy.

I chose to handle this ext4 filesystem replication myself at the application level, rather than using a filesystem that clusters or self-replciates because of KISS principles and waryness for running unproven third party code in my professional deployments.

### Initiailly

Initially, I developed a solution that uses 'cron' and rsync to repliciate a top-level unix directory from a 'primary' host out to three other web application hosts.

Crontab:

```
$ crontab -l
4,14,24,34,44,54 * * * * /opt/production-replicate.sh
```

The replication script itself: 
```
$ cat /opt/production-replicate.sh
rsync -razP --delete /opt/idship-gits-2016 app@production1:/opt/
rsync -razP --delete /opt/idship-gits-2016 app@production2:/opt/
rsync -razP --delete /opt/idship-gits-2016 app@production3:/opt/
``` 

This approach worked great for 24 months, but our appliciation content size constantly increased and the process slowed down over time.

```
$ du -h|tail
426G	.
```

### Last Year
In 2018, I had to respond to a support issue where my cron execution was 'overlapping' because the synchronizations started to take longer than 10 minutes, so I implemented a technique called 'pid files' that enables the replication script to check and see if any instances of itself are running before continuing. This greatly improved stability, but increased the replication time significantly, someimtes to hours.


### Today

Today, business users don't have any transparency into the length of time it will take for their new content to 'replicate' to production.  I am now getting requests multiple times per week to go and 'quick replciate' specific projects because the automated repliciation flow is not fast enough.   The whole reason I iam doing this project is so that I can remove my personal time from teh workflow, which will ultimately make the users happier because they no longer need to wait on me to press a button for them.

# The Experiment

We have one primary virtual machine: svsm2019student1  that needs to automatically replicate to two other virtual machines: sdvsm2019student2 and svsm2019student3.  The number of replication destinations is arbitary, and could be many if needed.

### Lsyncd

After web research, I chose to try 'lsyncd' to manage this replication for me.

```

apt install lsyncd

https://github.com/axkibe/lsyncd

https://axkibe.github.io/lsyncd/
```

### Configuration 

On student1, I created a new user : lsyncd  and a new directory: /mnt/sync, and set ownership to the lsyncd user.

I defined a new configuration file: lsyncd.conf

```
$ cat /mnt/lsyncd.conf

# https://axkibe.github.io/lsyncd/manual/config/layer4/

settings {
    logfile = "/var/log/lsyncd.log",
    statusFile = "/var/log/lsyncd-status.log",
    statusInterval = 20
}

sync {
   default.rsyncssh,
   source="/mnt/sync",
   host="svsm2019student2",
   excludeFrom="/etc/lsyncd.exclude",
   targetdir="/mnt/sync",
   rsync = {
     archive = true,
     compress = false,
     whole_file = true
   },
   ssh = {
     port = 22
   }
}

sync {
   default.rsyncssh,
   source="/mnt/sync",
   host="svsm2019student3",
   excludeFrom="/etc/lsyncd.exclude",
   targetdir="/mnt/sync",
   rsync = {
     archive = true,
     compress = false,
     whole_file = true
   },
   ssh = {
     port = 22
   }
}

```

## Testing

Create a date file on student1

```
$ date
Fri 05 Jul 2019 09:15:20 AM EDT

brockman@svsm2019student1:/mnt/sync$ date > date.txt
```

And on student2, you can see the result within a few seconds:

```
brockman@svsm2019student1:/mnt/sync$ cat date.txt
Fri 05 Jul 2019 09:15:20 AM EDT
```

Deletes even work!

student1
```
brockman@svsm2019student1:/mnt/sync$ sudo rm date.txt
[sudo] password for brockman:
```

student2
```
brockman@svsm2019student1:/mnt/sync$ ls -l date.txt
ls: cannot access 'date.txt': No such file or directory
```

Watching the log file shows good operations:
```
brockman@svsm2019student1:/mnt/sync$ tail -f /var/log/lsyncd.log
Fri Jul  5 09:15:36 2019 Normal: Finished (list): 0
Fri Jul  5 09:15:36 2019 Normal: Finished (list): 0
Fri Jul  5 09:16:44 2019 Normal: Calling rsync with filter-list of new/modified files/dirs
/date.txt
/
Fri Jul  5 09:16:44 2019 Normal: Calling rsync with filter-list of new/modified files/dirs
/date.txt
/
Fri Jul  5 09:16:44 2019 Normal: Finished (list): 0
```

## Performance

To approximate the large amount of disk usage in my application, I needed to generate a lot of date.  I used 'dd' and '/dev/urandom' and a couple of helper scripts:

```
brockman@svsm2019student1:/mnt/sync$ cat makeNoise.sh
#!/bin/sh

DIR=`uuidgen |cut -f 2 -d '-'`
mkdir -p $DIR

UUID=`uuidgen`

dd if=/dev/urandom of=$DIR/$UUID.rando bs=1M count=10 2> /dev/null

```

and a looping script that makes a lot:

```
brockman@svsm2019student1:/mnt/sync$ cat makeLotsOfNoise.sh
#!/bin/bash

END=10000

for i in $(seq 1 $END); do ./makeNoise.sh; done
```

While the replication was running, I used 'atop' and 'htop' to monitor system resources. CPU and Memory Usage was very low during replication, however the overall replication thruput was less than expected, about 1G/minute

One advantage of this new solution was that the replication happened in parallel for each machine, versus my initial cron implementation that was serial, machine by machine.

## Win

With 16G of used space, small file repliciations still went through within a few seconds.  This models the increased speed that my users will experience as their minor changes are quickly replicated, (just the deltas), versus having to wait for hours.

DRY - Don't Repeat Yourself - The system doesnm't need to re-scan the entire disk to look for changes every 10 minutes, instead it  uses a filesystem concept called inotify to listen for changes and react to just those changes.
 

