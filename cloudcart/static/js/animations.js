/*
=========================================
CloudCart Animations
=========================================
*/

document.addEventListener("DOMContentLoaded", () => {
  initializeScrollReveal();
  initializeNavbarScrollEffect();
});

/* =====================================
   Scroll Reveal
===================================== */

function initializeScrollReveal() {
  const revealElements = document.querySelectorAll(".reveal");

  if (revealElements.length === 0) {
    return;
  }

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("active");
        }
      });
    },
    {
      threshold: 0.15,
    },
  );

  revealElements.forEach((element) => {
    observer.observe(element);
  });
}

/* =====================================
   Navbar Scroll Effect
===================================== */

function initializeNavbarScrollEffect() {
  const navbar = document.querySelector(".navbar");

  if (!navbar) {
    return;
  }

  window.addEventListener("scroll", () => {
    if (window.scrollY > 40) {
      navbar.classList.add("navbar-scrolled");
    } else {
      navbar.classList.remove("navbar-scrolled");
    }
  });
}
