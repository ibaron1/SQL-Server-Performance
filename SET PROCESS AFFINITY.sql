 -- max number of CPUs on machine or VM based on the license max:
 -- Dev, Enterprise = max on machine | standard = 4 sockets or 24 cores whichever is less
 -- this is to change 'Visible Online' 

/*
The ALTER SERVER CONFIGURATION SET PROCESS AFFINITY command in SQL Server is used to configure processor affinity, which binds SQL Server threads to specific CPUs or NUMA nodes. This can improve performance in certain scenarios by reducing context switching and improving cache utilization.
To set processor affinity to CPUs 0 through 7, use the following syntax: 
*/

ALTER SERVER CONFIGURATION SET PROCESS AFFINITY CPU = 0 TO 7;

--To set processor affinity to NUMA node 0, use the following syntax: 

ALTER SERVER CONFIGURATION SET PROCESS AFFINITY NUMANODE = 0;

/*
It is important to note that setting processor affinity can sometimes hinder performance if not configured correctly. 
It is recommended to test different configurations to find the optimal setting for a specific workload. 
Additionally, trace flag 8002 can be used to disable the scheduler's CPU binding, allowing for more flexibility in CPU allocation.
*/
select max(scheduler_id) from sys.dm_os_schedulers where status = 'VISIBLE ONLINE'