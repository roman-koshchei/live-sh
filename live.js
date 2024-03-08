document.addEventListener("visibilitychange", function () {
  "visible" === document.visibilityState &&
    setTimeout(function () {
      location.assign(location.href)
    }, 250)
})
