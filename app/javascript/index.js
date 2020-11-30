window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull_down")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
})