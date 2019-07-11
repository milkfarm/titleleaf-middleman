function toggleMenu() {
  var x = document.getElementById("menu");
  if (x.className === "") {
    x.className += "active";
  } else {
    x.className = "";
  }
}
