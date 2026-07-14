/*
=========================================
CloudCart Global JavaScript
=========================================
*/

document.addEventListener("DOMContentLoaded", () => {
  initializeMobileNavigation();
  initializeSmoothScroll();
});

/* =====================================
   Mobile Navigation
===================================== */

function initializeMobileNavigation() {
  const menuButton = document.getElementById("menu-toggle");
  const navigation = document.getElementById("nav-links");

  if (!menuButton || !navigation) {
    return;
  }

  menuButton.addEventListener("click", () => {
    navigation.classList.toggle("active");
  });
}

/* =====================================
   Smooth Scroll
===================================== */

function initializeSmoothScroll() {
  const links = document.querySelectorAll('a[href^="#"]');

  links.forEach((link) => {
    link.addEventListener("click", function (event) {
      const target = document.querySelector(this.getAttribute("href"));

      if (!target) {
        return;
      }

      event.preventDefault();

      target.scrollIntoView({
        behavior: "smooth",
        block: "start",
      });
    });
  });
}
