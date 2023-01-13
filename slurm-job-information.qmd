# Job Information

Query all jobs within the last day

```bqsh
sacct --starttime=today --endtime=midnight --format=User,JobID,Jobname%50,partition,state,time,start,end,elapsed,MaxRss,MaxVMSize,nnodes,ncpus,nodelist --units=G
```

Query information for a specific job:
```bash
sacct -j <jobid> --format=User,JobID,Jobname%50,partition,state,time,start,end,elapsed,MaxRss,MaxVMSize,nnodes,ncpus,nodelist
```

See how nodes are configured.

```bash
# Customized information https://ask.cyberinfrastructure.org/t/how-do-i-get-the-list-of-features-and-resources-of-each-node-in-slurm/201
sinfo -o "%20N  %10c  %10m  %25f  %10G "

# Or view a more traditional list:
scontrol show node
```

See information for a specific node

```bash
scontrol show node "nodename"
```

View queued job information for yourself

```bash
squeue --format="%.7i %.9P %.8j %.8u %.2t %.10M %.6D %C" -u $USER
```

See format (`-o`) options at: <https://slurm.schedmd.com/squeue.html>
