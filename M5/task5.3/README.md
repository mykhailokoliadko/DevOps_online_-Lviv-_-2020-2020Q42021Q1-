<h2>How many state has process</h2>

-Runnable
-Runnig
-Sleeaping
-Stopped
-Zombie


<h2>pstree command</h2>

pstree -shc number_PID

here image

<h2>What is /proc</h2>
proc is Virtual file system, it contains information about ongoing processes, memory managment and some hadware information.It also regarded as control and information centre for kernel.
The proc file system also provides communication medium between kernel space and user space.

The numbered files are directories that correspond to process numbers or process IDs (PIDs)

5.1_1.3

<h2>Print information about processor</h2>
lscpu 
cat /proc/cpuinfo

But lscpu actually use cat /proc/cpuinfo as source

5.1_1.4.1
5.1_1.4.2

<h2>Use the ps command to get information about the process</h2>



<h2>How to define kernel processes and user processes</h2>

Kernel processes are children of PID 2 (kthreadd)

ps --ppid 2 -p 2 -o uname,pid,ppid,cmd,cls
Add --deselect to invert the selection and see only user-space processes.
5.3_6.1
5.3_6.2


<h2>Print the list of processes to the terminal. Briefly describe the statuses of the processes.</h2>


5.3_7.1 - 5.3_7.8


Ss - Sleeping and the process is interruptible it will respond when needed and the session leader.
S - Sleeping and the process is interruptible
I< - Idle kernel thread and high priority process
SN - Sleeping and the process is interruptible it will respond when needed and low-priority
S<s - Sleeping and the process is interruptible but high priority task
Ssl - Sleeping and the process is interruptible and session leader and multi-threaded
S< - Sleeping and the process is interruptible and high priority
SNsl - Sleeping and the process is interruptible and low priority, session leader and multi-threaded
S<sl - Sleeping and the process is interruptible and hight priority, session leader and multi-threaded
Sl - Sleeping and the process is interruptible and multi-threaded
Sl+ - Sleeping and the process is interruptible and multi-threaded and foreground proces
Ssl+ - Sleeping and the process is interruptible and session leader and multi-threaded and foreground proces
SLs - Sleeping and the process is interruptible and process has pages that are locked into memory and session leader or a process that has started process groups
R+ - Runnig and foreground proces
S+ - Sleeping and the process is interruptible and foreground proces

Exist 5 states of process in linux  

- Running - these are running processes that are currently using a CPU core
- Runnable - A runnable process means that a process has everything it needs in order to run and is waiting for an available CPU core slot (ready to run).
- Sleeping - this is a process that is waiting for a specific resource to be available (for instance, I/O operation to complete) or an event to occur (an amount of time to pass for example)
  a - interruptible waiting processes : these are processes whose tasks can be disrupted or interrupted by signals . They can be killed before the wake up condition is met or fulfilled without further consequences
  b - uninterruptible waiting processes : these are processes whose tasks cannot be interrupted by any signal or event. While waiting for the result, I/O operations for instance switch to an uninterruptible waiting state. When the operation is ready, they will wake up to handle the result and check for any pending signal to manage.
- Stopped - A process is stopped when it receives the signal SIGSTOP (like for example when you hit <ctrl>+z in the terminal). The process execution is then suspended and it will manage only the SIGKILL and SIGCONT signals. For instance, a process that is being debugged is in a stopped state.
- Zombie - When a child process gets killed before its parent, it will become a zombie. This process is neither alive nor dead. It has finished its assigned task with exit() system call. It still has an entry in the process table though



<h2>What information does top command display</h2>

5.3_10

The top command contains statistics on processes and resource usage, while the lower half contains a list of the currently running processes

There is a lot of useful information about the system in particular 

System time, uptime and user sessions - At the very top left of the screen, top displays the current time. This is followed by the system uptime, which tells us the time for which the system has been running. For instance, in our example, the current time is “21:45:39”, and the system has been running for 5 days, 8 hours and 11 minutes. Next number of active user sessions (we have 1)
Tasks - The “Tasks” section shows statistics regarding the processes running on your system. The “total” value is simply the total number of processes. For example, in the above screenshot, there are 229 processes running/2 runnig/227 sleeping/0 stoped/0 zombie.
CPU usage - The CPU usage section shows the percentage of CPU time spent on various tasks.
Memory usage - The memory section shows information regarding the memory usage of the system.


Ok now about task area

PID - process ID
USER - This is the username of the user who started the process.
PR and NI - The “NI” field shows the “nice” value of a process. The “PR” field shows the scheduling priority of the process from the perspective of the kernel. The nice value affects the priority of a process.
VIRT, RES, SHR, MEM - These three fields are related with to memory consumption of the processes. “VIRT” is the total amount of memory consumed by a process. This includes the program’s code, the data stored by the process in memory, as well as any regions of memory that have been swapped to the disk. “RES” is the memory consumed by the process in RAM, and “%MEM” expresses this value as a percentage of the total RAM available. Finally, “SHR” is the amount of memory shared with other processes.
S - state of process
TIME+ - This is the total CPU time used by the process since it started, precise to the hundredths of a second.
COMMAND - Shows the name of the processes

<h2>Display the processes of the specific user using the top command.</h2>

Just pres "u" key and then type the name of user and hit enter))

<h2>What interactive commands can be used to control the top command</h2>

We can type f or F to activate Fields-Management.
These keys display a separate screen where we can change which fields are displayed, their order, and also designate the sort field.

5.3_12.1

<h2>Sort the contents of the processes window using various parameters</h2>

We can use <code>shift+f</code> to sort output of top command

5.3_13.1 - original
5.3_13.2 - sort by CPU time
5.3_13.3 - sort by PR
5.5_13.4 - sort by user


<h2>Concept of priority, what commands are used to set priority</h2>

Processes that have higher priority will get more CPU time than those with lower priority. Linux controls priority using a value which is called niceness.
High priority processes are supposed to be less nice, since they are bad at sharing resources. Low priority processes however, are considered nice because they take minimal resources.

<code>nice</code> - Nice runs a command with an adjusted niceness, which affects process scheduling
<code>renice</code> - Allows you to change and modify the scheduling priority of an already running process
<code>NI</code> Column indicates the process nice value


<h2>Concept of priority, what commands are used to set priority</h2>

Yes we can!

launch top utility and then type <code>r</code>
then type PID of the process that we want to change
and then renice value and hit Enter))

<h2>Examine the kill command</h2>

Most commonly used signals

SIGHUP - Hangup, reload a process
SIGINT - Interrupt from keyboard
SIGKILL - Kill a process
SIGTERM - Terminate a process gracefully
SIGSTOP - Stop a process

<h4>How to send signal</h4>
Pattern -> kill [signal][PID]
All the same
- kill -9 21567
- kill -SIGKILL 21567
- kill -kill 21567

<h2>Commands jobs, fg, bg, nohup. What are they for?</h2>

<code>jobs</code> - Display the status of jobs
<code>fg</code> - When a task runs in the background, using the fg command will bring it into the foreground
<code>bg</code> - The bg command is used to resume suspended background jobs
<code>nohup</code> - Nohup, short for no hang up is a command in Linux systems that keep processes running even after exiting the shell or terminal.


5.5_17(17.1)

Run sleep command
Then type <code>ctrl+z</code> to put process in background(or use "&"), resume status with <code>ps</code> command and then brining a process to the foreground with <code>fg</code>.


























