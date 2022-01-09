# `stat` and `statstudent` partition configuration

Last pulled 01/8/22

## `stat`

```sh
scontrol show partition stat 
```

```sh
PartitionName=stat
   AllowGroups=acc-stat,acc-stat-qu AllowAccounts=ALL AllowQos=ALL
   AllocNodes=ALL Default=NO QoS=N/A
   DefaultTime=00:30:00 DisableRootJobs=YES ExclusiveUser=NO GraceTime=0 Hidden=NO
   MaxNodes=UNLIMITED MaxTime=14-00:00:00 MinNodes=0 LLN=NO MaxCPUsPerNode=UNLIMITED
   Nodes=golub[113-116,231-234],ccc[0035-0036,0085-0090,0270-0271]
   PriorityJobFactor=1 PriorityTier=3 RootOnly=NO ReqResv=NO OverSubscribe=YES:4
   OverTimeLimit=NONE PreemptMode=OFF
   State=UP TotalCPUs=536 TotalNodes=18 SelectTypeParameters=NONE
   JobDefaults=(null)
   DefMemPerCPU=2150 MaxMemPerNode=UNLIMITED
```

## `statstudent`

```sh
scontrol show partition statstudent
```

```sh
PartitionName=statstudent
   AllowGroups=acc-stat AllowAccounts=ALL AllowQos=ALL
   AllocNodes=ALL Default=NO QoS=N/A
   DefaultTime=00:30:00 DisableRootJobs=YES ExclusiveUser=NO GraceTime=0 Hidden=NO
   MaxNodes=UNLIMITED MaxTime=7-00:00:00 MinNodes=0 LLN=NO MaxCPUsPerNode=UNLIMITED
   Nodes=golub[113-116,231-234],ccc[0035-0036,0089-0090,0270-0271]
   PriorityJobFactor=1 PriorityTier=3 RootOnly=NO ReqResv=NO OverSubscribe=YES:4
   OverTimeLimit=NONE PreemptMode=OFF
   State=UP TotalCPUs=376 TotalNodes=14 SelectTypeParameters=NONE
   JobDefaults=(null)
   DefMemPerCPU=2150 MaxMemPerNode=UNLIMITED
```
