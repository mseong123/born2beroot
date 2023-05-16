#!/bin/bash

#ARCHITECTURE
arch=$(uname -a)

#CPU PHYSICAL
cpuP=$(cat /proc/cpuinfo | grep "physical id" | wc -l)

#CPU VIRTUAL
cpuV=$(cat /proc/cpuinfo | grep "processor" | wc -l)

#RAM
totalRAM=$(free --mega | awk '$1 == "Mem:" {print $2}')
usedRAM=$(free --mega | awk '$1 == "Mem:" {print $3}')
percRAM=$(free --mega | awk '$1 == "Mem:" {printf("%.2f%%"), $3/$2*100}')

#DISK SPACE
usedDisk=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{used_disk+=$3} END {print used_disk}')
totalDisk=$(df -Bg | grep "/dev/" | grep -v "/boot" | awk '{total_disk+=$2} END {print total_disk}')
percDisk=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{used_disk+=$3} {total_disk+=$2} END {print used_disk/total_disk*100}')

#CPU USAGE
cpuUsage=$(vmstat | tail -1 | awk '{printf("%.1f"), (100-$15)/100}'

#LAST BOOT
lastBoot=$(who -b | awk '$1 == "system" {print $3 " " $4}')

#LVM USE
lvmu=$(if[$(lsblk | grep "lvm" | wc -l) -eq 0]; then echo yes;else echo no; fi)

#TCP CONNECTIONS
tcpcon=$(ss -ta | grep "ESTAB" | wc -l)

#USERS
users=$(users | wc -w)




