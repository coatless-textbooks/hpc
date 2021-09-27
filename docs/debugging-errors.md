
# Errors

## Debugging bad _R_ version

Note, per our previous discussion, we request cluster users to load R using the `_sandybridge` suffix. 
Failure to load R in this manner will result in:

```bash
*** caught illegal operation ***
address 0x2b8c139d59ef, cause 'illegal operand'
```

The error will present itself only when matrix multiplication is present, e.g. `%*%`.

## Remote Compute Jobs

When doing a long-running computation with `future.batchtools`, you may get the following errors under `plan(remote)`

```
client_loop: send disconnect: Broken pipe
Connection to <host address> closed by remote host.
```
