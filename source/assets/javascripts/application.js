function toggleMenu() {
  var x = document.getElementById("menu");
  if (x.className === "") {
    x.className += "active";
  } else {
    x.className = "";
  }
}

function toggleAccordion() {
  var acc = document.getElementsByClassName("accordion-toggler");
  var i;
  for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var panel = this.nextElementSibling;
      if (panel.style.display === "block") {
        panel.style.display = "none";
      } else {
        panel.style.display = "block";
      }
    });
  }
}

// Source: http://www.sitepoint.com/article/standards-compliant-world/
function externalLinks() {
  if ( !document.getElementsByTagName ) return;
  var anchors = document.getElementsByTagName("a");
  for ( var i=0; i<anchors.length; i++ ) {
    var anchor = anchors[i];
    if ( anchor.getAttribute("href") && anchor.getAttribute("rel") == "external" )
      anchor.target = "_external";
  }
}
window.onload = externalLinks;
