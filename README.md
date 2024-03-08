# Live shell

Live reloading with Bash for any language and any framework

## Get started

Copy [live.sh](./live.sh) into your project directory

Change instructions inside of `run` function.
Notice **long running process should be run in background and saved to previous_pid**.
Here is example to run Gleam project, where `gleam run` is long running process:

```bash
run() {
  gleam run &
  previous_pid=$!
  gleam format &
}
```

Run script with `./live.sh`. If you are on **Windows** then use `Git Bash` or `WSL`.
