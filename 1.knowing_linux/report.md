## Part 1. Installation of the OS.

<p style="margin-left: 50px;">Install Ubuntu 20.04 Server LTS without GUI. (Use VirtualBox)</p>

<div style="margin-left: 50px;">
    <p>Import ubuntu 20.04.3 LTS operating system from Users/shared/vbox_ubuntu.ova</p>

  <img src="screen/install_1.png" alt="drawing" width="40%"/>
  <img src="screen/install_2.png" alt="drawing" width="40%"/><br><br>

> `cat /etc/issue`  

  <img src="screen/issue.png" alt="drawing" width="40%"/><br><br>

  </div>

## Part 2. Creating a user.

<p style="margin-left: 50px;"><i>Create a user other than the one created during installation. <br>The user must have permission to read logs from the /var/log folder.</i></p> 

<div style="margin-left: 50px;">

  > `sudo useradd -m -G adm -s /bin/bash rzhao`  

  > `cat /etc/passwd | grep rzhao`  

  > `ls /home/`  

  > `sudo passwd rzhao`  

  <img src="screen/createUser.png" alt="drawing" width="50%"/><br><br>

  > `login: rzhao`

  <img src="screen/loginRzhao.png" alt="drawing" width="40%"/><br><br>
  </div>

## Part 3. Setting up the OS network.

<div style="margin-left: 50px;">

***Set the machine name as user-1.***<br>
  For convenience, I change a user with rights root and set computer name to <b>user-1</b>

  > `sudo usermod -o -u 0 -G 0 -s /bin/bash rzhao`  

  > `sudo hostnamectl set-hostname user-1`  

  <img src="screen/newHostname.png" alt="drawing" width="50%"/><br><br>

***Set the time zone corresponding to your current location.***
Option 1

  Commands timedatectl

  > `timedatectl list-timezones | grep Novosibirsk`

  > `timedatectl set-timezone Asia/Novosibirsk`

  <img src="screen/timezone_1.png" alt="drawing" width="50%"/><br>

Option 2
   
  Commands /etc/localtime

   > `sudo unlink /etc/localtime`

   > `sudo ln -s /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime`
  
  <img src="screen/timezone_2.png" alt="drawing" width="60%"/><br><br>

***Output the names of the network interfaces using a console command.***
  
The loopback (lo=127.0.0.1) device is a special, virtual network interface that your computer uses to communicate with itself. <br>It is used mainly for diagnostics and troubleshooting, and to connect to servers running on the local machine.
  
  <img src="screen/interfaces.png" alt="drawing" width="50%"/><br><br>

***Use the console command to get the ip address of the device you are working on from the DHCP server.***

The Dynamic Host Configuration Protocol (DHCP) <br>
is a network management protocol used on Internet Protocol (IP) networks for automatically assigning IP addresses <br>
and other communication parameters to devices connected to the network using a client–server architecture.

> `sudo ip link set enp0s3 down`

> `sudo ifconfig enp0s3`

> `cat /etc/netplan/00-installer-config.yaml`

> `sudo ip link set enp0s3 up`

<img src="screen/netplan.png" alt="drawing" width="50%"/><br><br>

***Define and display the external ip address of the gateway (ip) and the internal IP address of the gateway, aka default ip address (gw).***

Gateway ip default = 10.0.2.2

Internal addresses in range = 10.0.2.0/24

Ip adress PC = 10.0.2.15

> `route -n`

or

> `ip route`

<img src="screen/ipRoute.png" alt="drawing" width="50%"/><br><br>

***Set static (manually set, not received from DHCP server) ip, gw, dns settings (use public DNS servers, e.g. 1.1.1.1 or 8.8.8.8).***

Opening and editing /etc/netplan/00-installer-config.yaml

> `vi /etc/netplan/00-installer-config.yaml`

<img src="screen/netplanOpen.png" alt="drawing" width="50%"/><br><br>

Ask addresses, gateway, dns and dhcp

<img src="screen/netplanEdit.png" alt="drawing" width="50%"/><br><br>

Save, reboot and check.

<img src="screen/netplanOk.png" alt="drawing" width="50%"/><br><br>

Reboot virtual PC.

> `reboot`

<img src="screen/reboot.png" alt="drawing" width="50%"/><br><br>

Ping to 1.1.1.1, 8.8.8.8, mail.ru.

> `ping -c 5 1.1.1.1`

<img src="screen/netplanPing.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 4. OS Update.

<div style="margin-left: 50px;">

***Launch update OS.***

> `sudo apt apdate`

> `apt list --apgradable`

<img src="screen/updateList.png" alt="drawing" width="50%"/><br><br>

***Launch upgrade OS and packages.***

> `sudo apt upgrade`

<img src="screen/upgrade_1.png" alt="drawing" width="50%"/><br>
<img src="screen/upgrade_2.png" alt="drawing" width="50%"/><br><br>

***Cheked update OS.***

> `sudo apt update`

<img src="screen/updateCheck.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 5. Using the sudo Commands.
  
<div style="margin-left: 50px;">

***SUDO*** is a program for Unix-like computer operating systems that enables users to run programs with the security privileges of another user,<br>
by default the superuser. It stands for "superuser do", as originally that is all it did, and it is its most common usage; however,<br>
a common false etymology is "substitute user, do", because sudo can run a command as other users as well.<br>

Command use ***sudo*** and set hostname

> `sudo hostnamectl set-hostname rzhao`

<img src="screen/hostnameRzhao.png" alt="drawing" width="50%"/><br><br>

Package version ***sudo***

> `apt list sudo`

<img src="screen/sudoPackege.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 6. Installing and configuring the time service.
  
<div style="margin-left: 50px;">

> `timedatectl status`

<img src="screen/time.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 7. Installing and using text editors.
  
<div style="margin-left: 50px;">

***Install VIM text editor (+ any two others if you like NANO, MCEDIT, JOE etc.)***

> `sudo apt install vim`

> `sudo apt install nano`

> `sudo apt install joe`

<img src="screen/vimInstall.png" alt="drawing" width="50%"/><br><br>

* Add screenshots to the report:
  
Of each editor with the contents of the file before closing.

* Write down in the report what you have done to exit with the changes saved.

1. To opem with ***vim:***

> `vim test_vim.txt`

* Exit vim with save:

> `:wq`

<img src="screen/vim_1.png" alt="drawing" width="50%"/><br><br>

2. To open with ***nano:***

> `nano test_nano.txt`

* Exit nano with save:

> `Ctrl + X`

> `Y`

> `Enter`

<img src="screen/nano_1.png" alt="drawing" width="50%"/><br><br>

3. To open with ***joe:***

> `joe test_joe.txt`

* Exit joe with save:

> `Ctrl + K + X`

<img src="screen/joe_1.png" alt="drawing" width="50%"/><br><br>

***Using each of the three selected editors, open the file for editing, edit the file by replacing the nickname with the "21 School 21" string, close the file without saving the changes.***

* Add screenshots to the report:

  Of each editor with the contents of the file after editing.

* Write down in the report what you have done to exit without saving the changes.

> `vim test_vim.txt`

> `:q!`

<img src="screen/vim_2.png" alt="drawing" width="50%"/><br><br>

> `nano test_nano.txt`

> `Ctrl + X`

> `N`

<img src="screen/nano_2.png" alt="drawing" width="50%"/><br><br>

> `joe test_joe.txt`

>`Ctrl + K + Q`

> `N`

<img src="screen/joe_2.png" alt="drawing" width="50%"/><br><br>

All cat files:

<img src="screen/cat.png" alt="drawing" width="50%"/><br><br>

***Using each of the three selected editors, edit the file again (similar to the previous point) <br>and then master the functions of searching through the contents of a file (a word) <br>and replacing a word with any other one.***

Add screenshots to the report:

* Of each editor with word search results.

* Of each editor with commands entered to replace a word with another.

Vim search:

> `/School`

<img src="screen/vimSearch.png" alt="drawing" width="50%"/><br><br>

Vim replace:

> `:%s/School/University/g`

<img src="screen/vimReplace.png" alt="drawing" width="50%"/><br><br>

Nano search:

> `Ctrl + \`

> `Ctrl + R`

<img src="screen/nanoSearch.png" alt="drawing" width="50%"/><br><br>

Nano replace:

> `Ctrl + \`

> `Search text`

> `Replace text`

> `Enter`

<img src="screen/nanoReplace_1.png" alt="drawing" width="50%"/><br>
<img src="screen/nanoReplace_2.png" alt="drawing" width="50%"/><br><br>

Joe search:

> `Ctrl + K + F`

> `b` or `bi`

> `Enter`

<img src="screen/joeSearch.png" alt="drawing" width="50%"/><br><br>

Joe replace:

> `Ctrl + K + F`

> `r` or `ri`

> `Replace text`

> `Enter`

<img src="screen/joeReplace_1.png" alt="drawing" width="50%"/><br><br>
<img src="screen/joeReplace_2.png" alt="drawing" width="50%"/><br><br>
<img src="screen/joeReplace_3.png" alt="drawing" width="50%"/><br><br>
<img src="screen/joeReplace_4.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 8. Installing and basic setup of the SSHD service.

<div style="margin-left: 50px;">

***Install the SSHd service.***

> `sudo apt update`

> `sudo apt-get install ssh`

> `sudo apt install openssh-server`

<img src="screen/8/installSSH.png" alt="drawing" width="50%"/><br><br>
<img src="screen/8/installOpenSshServer.png" alt="drawing" width="50%"/><br><br>

***Add an auto-start of the service whenever the system boots.***

> `sudo systemctl enable ssh`

> `systemctl status ssh`

<img src="screen/8/sshEnable.png" alt="drawing" width="50%"/><br><br>
<img src="screen/8/checkSshEnable.png" alt="drawing" width="50%"/><br><br>


***Reset the SSHd service to port 2022.***

> `sudo vim /etc/ssh/sshd_config`

> `sudo systenctl restart sshd`

<img src="screen/8/openSshConfig.png" alt="drawing" width="50%"/><br><br>
<img src="screen/8/vimSshdConfig.png" alt="drawing" width="50%"/><br><br>
<img src="screen/8/restartSshd.png" alt="drawing" width="50%"/><br><br>


***PS*** is a command that lists the running processes of the operating system.

flag ***-A*** lists all processes.

***grep*** command and pattern ***sshd***, allow you to filter out all patterns and display only those that match the pattern.

<img src="screen/8/ps.png" alt="drawing" width="50%"/><br><br>

***Output netstat***

***netstat -tan Shows all TCP connections with no DNS resolution (show IP addresses instead).***

Netstat provides statistics for the following:

* Proto – The name of the protocol (TCP or UDP).
  
* Local Address – The IP address of the local computer and the port number being used. The name of the local computer that corresponds to the 

* IP address and the name of the port is shown unless the -n parameter is specified. An asterisk (*) is shown for the host if the server is listening on all interfaces. If the port is not yet established, the port number is shown as an asterisk.

* Foreign Address – The IP address and port number of the remote computer to which the socket is connected. The names that corresponds to the IP address and the port are shown unless the -n parameter is specified. If the port is not yet established, the port number is shown as an asterisk (*).
  
* State – Indicates the state of a TCP connection. The possible states are as follows: CLOSE_WAIT, CLOSED, ESTABLISHED, FIN_WAIT_1, FIN_WAIT_2, LAST_ACK, LISTEN, SYN_RECEIVED, SYN_SEND, and TIME_WAIT. For more information about the states of a TCP connection, see RFC 793.

> `netstat -tan`

* t - Display only TCP connections.

* a - Displays all active connections and the TCP and UDP ports on which the computer is listening.

* n - Displays active TCP connections, however, addresses and port numbers are expressed numerically and no attempt is made to determine names.

* 0.0.0.0 - used to keep track of connections on all IP addresses assigned by that address's interface

<img src="screen/8/netstat-tan.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 9. Installing and using the top, htop utilities.

<div style="margin-left: 50px;">

1. From the output of the top command determine and write in the report:  
* uptime: 5 min;
* number of authorised users: 1;
* total system load: 0.04, 0.03, 0,00 (1min, 5min, 15 min); 
* total number of processes: 108;
* cpu load: 0.0 us, 0.2 sy, 0.0 ni, 99.8 id, 0.0 wa, 0.0 hi 0.0 si 0.0 st;
* memory load: 976.0 total, 312.5 free, 202.5 used, 461.6 buff/cache;
* pid of the process with the highest memory usage: 674
* pid of the process taking the most CPU time: 899

Sort by memory
> `Shift + M`

Sort by CPU
> `Shift + P`

<img src="screen/9/top.png" alt="drawing" width="50%"/><br><br>

2. Add a screenshot of the htop command output to the report:
* sorted by PID, PERCENT_CPU, PERSENT_MEM, TIME
* filtered for sshd process
* with the syslog process found by searching
* with hostname, clock and uptime output added

> `sort by ***PID***`

<img src="screen/9/htopPid.png" alt="drawing" width="50%"/><br><br>

> `sort by ***PERCENT_CPU***`

<img src="screen/9/htopCpu.png" alt="drawing" width="50%"/><br><br>

> `sort by ***PERSENT_MEM***`

<img src="screen/9/htopMem.png" alt="drawing" width="50%"/><br><br>

> `sort by ***TIME***`

<img src="screen/9/htopTime.png" alt="drawing" width="50%"/><br><br>

> `filtered for sshd process`

<img src="screen/9/htopSsh.png" alt="drawing" width="50%"/><br><br>

> `search syslog`

<img src="screen/9/htopSyslog.png" alt="drawing" width="50%"/><br><br>

> `with hostname, clock and uptime output added`

<img src="screen/9/htopHostname.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 10. Using the fdisk utility.

<div style="margin-left: 50px;">

<img src="screen/10/fdisk.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 11. Using the df utility.

<div style="margin-left: 50px;">

***In the report write for the root partition***

<img src="screen/11/df.png" alt="drawing" width="50%"/><br><br>

* Unit in the report: 1 Kb

***Run the df -Th command.***

<img src="screen/11/df-Th.png" alt="drawing" width="50%"/><br><br>

* The file system type: ext4

</div>

## Part 12. Using the du utility.

<div style="margin-left: 50px;">

> `sudo du`

<img src="screen/12/du.png" alt="drawing" width="50%"/><br><br>

> `sudo du -scmh /var/log /var /home`

<img src="screen/12/du-hscm.png" alt="drawing" width="50%"/><br><br>

> `sudo du -ch /var/log`

<img src="screen/12/duLog.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 13. Installing and using the ncdu utility.

<div style="margin-left: 50px;">

<img src="screen/13/installNcdu.png" alt="drawing" width="50%"/><br><br>

<img src="screen/13/home.png" alt="drawing" width="50%"/><br><br>

<img src="screen/13/var.png" alt="drawing" width="50%"/><br><br>

<img src="screen/13/varLog.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 14. Working with system logs.

<div style="margin-left: 50px;">

<img src="screen/14/start.png" alt="drawing" width="50%"/><br><br>

<img src="screen/14/authLog.png" alt="drawing" width="50%"/><br><br>

<img src="screen/14/restartSsh.png" alt="drawing" width="50%"/><br><br>

</div>

## Part 15. Using the CRON job scheduler.

<div style="margin-left: 50px;">

> `crontab -e`

<img src="screen/15/cronCreate.png" alt="drawing" width="50%"/><br><br>

> `cat /var/log/syslog | grep uptime`

<img src="screen/15/cron.png" alt="drawing" width="50%"/><br><br>

> `crontab -r`

<img src="screen/15/cronDel.png" alt="drawing" width="50%"/><br><br>

</div>