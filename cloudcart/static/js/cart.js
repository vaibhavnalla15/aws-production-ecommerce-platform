/*
=========================================
CloudCart Cart
=========================================
*/

document.addEventListener("DOMContentLoaded", () => {
  initializeQuantityButtons();
  initializeRemoveButtons();
});

/* =====================================
   Quantity Buttons
===================================== */

function initializeQuantityButtons() {
  const quantityContainers = document.querySelectorAll(".quantity-selector");

  if (quantityContainers.length === 0) {
    return;
  }

  quantityContainers.forEach((container) => {
    const decreaseButton = container.querySelector(".decrease");
    const increaseButton = container.querySelector(".increase");
    const quantityInput = container.querySelector(".quantity-input");

    if (!decreaseButton || !increaseButton || !quantityInput) {
      return;
    }

    decreaseButton.addEventListener("click", () => {
      let quantity = parseInt(quantityInput.value);

      if (quantity > 1) {
        quantityInput.value = quantity - 1;
      }
    });

    increaseButton.addEventListener("click", () => {
      let quantity = parseInt(quantityInput.value);

      quantityInput.value = quantity + 1;
    });
  });
}

/* =====================================
   Remove Cart Item
===================================== */

function initializeRemoveButtons() {
  const removeButtons = document.querySelectorAll(".remove-item");

  if (removeButtons.length === 0) {
    return;
  }

  removeButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const cartItem = button.closest(".cart-item");

      if (cartItem) {
        cartItem.remove();
      }
    });
  });
}
