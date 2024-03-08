# Live shell

```
 __    ____  _  _  ____    ___  _   _
(  )  (_  _)( \/ )( ___)  / __)( )_( )
 )(__  _)(_  \  /  )__)   \__ \ ) _ (
(____)(____)  \/  (____)()(___/(_) (_)
```

Live reloading with Bash for any language and any framework

## Get started

Copy [live.sh](./live.sh) into your project directory

```bash
curl -o live.sh https://raw.githubusercontent.com/roman-koshchei/live-sh/main/live.sh
```

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

## Browser reloading

If you are building web app you may want to automatically reload browser tab after live reloading project. For it you need to add javascript script to your site, don't forget to **disable it in production**.

Just embed [live.js](./live.js) into your `head` like this:

```html
<head>
  <script>
    document.addEventListener("visibilitychange", function () {
      "visible" === document.visibilityState &&
        setTimeout(function () {
          location.assign(location.href)
        }, 250)
    })
  </script>
</head>
```
