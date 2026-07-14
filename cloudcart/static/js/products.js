/*
=========================================
CloudCart Products
=========================================
*/

document.addEventListener("DOMContentLoaded", () => {
  initializeProductSearch();
  initializeCategoryFilter();
});

/* =====================================
   Product Search
===================================== */

function initializeProductSearch() {
  const searchInput = document.getElementById("product-search");
  const productCards = document.querySelectorAll(".product-card");

  if (!searchInput || productCards.length === 0) {
    return;
  }

  searchInput.addEventListener("input", () => {
    const keyword = searchInput.value.toLowerCase().trim();

    productCards.forEach((card) => {
      const title = card.dataset.name.toLowerCase();

      if (title.includes(keyword)) {
        card.style.display = "";
      } else {
        card.style.display = "none";
      }
    });
  });
}

/* =====================================
   Category Filter
===================================== */

function initializeCategoryFilter() {
  const categoryFilter = document.getElementById("category-filter");
  const productCards = document.querySelectorAll(".product-card");

  if (!categoryFilter || productCards.length === 0) {
    return;
  }

  categoryFilter.addEventListener("change", () => {
    const selectedCategory = categoryFilter.value;

    productCards.forEach((card) => {
      const category = card.dataset.category;

      if (selectedCategory === "all" || category === selectedCategory) {
        card.style.display = "";
      } else {
        card.style.display = "none";
      }
    });
  });
}
