/*
=========================================
CloudCart Cart
=========================================
*/

document.addEventListener("DOMContentLoaded", () => {
  initializeQuantityButtons();
  initializeRemoveButtons();
  initializeAddToCart();
  initializeCheckout();
  updateCartCount();
  renderCart();
});

/* =====================================
   Add To Cart
===================================== */

function initializeAddToCart() {
  const addButton = document.querySelector(".add-to-cart-btn");

  if (!addButton) return;

  addButton.addEventListener("click", () => {
    const cart = JSON.parse(localStorage.getItem("cloudcart-cart")) || [];

    const product = {
      id: Number(addButton.dataset.id),
      name: addButton.dataset.name,
      price: Number(addButton.dataset.price),
      image: addButton.dataset.image,
      quantity: 1,
    };

    const existing = cart.find((item) => item.id === product.id);

    if (existing) {
      existing.quantity++;
    } else {
      cart.push(product);
    }

    localStorage.setItem("cloudcart-cart", JSON.stringify(cart));

    updateCartCount();

    alert("Product added to cart successfully!");
  });
}

/* =====================================
   Render Cart
===================================== */

function renderCart() {
  const cartContainer = document.getElementById("cart-items");

  if (!cartContainer) return;

  let cart = JSON.parse(localStorage.getItem("cloudcart-cart")) || [];

  const checkoutButton = document.getElementById("checkout-btn");

  if (checkoutButton) {
    if (cart.length === 0) {
      checkoutButton.disabled = true;
      checkoutButton.textContent = "Cart is Empty";
    } else {
      checkoutButton.disabled = false;
      checkoutButton.textContent = "Proceed to Checkout";
    }
  }

  cartContainer.innerHTML = "";

  if (cart.length === 0) {
    cartContainer.innerHTML = `
    <div class="card empty-cart-card">
        <img
          src="/static/images/illustrations/empty-cart.png"
          alt="Empty Cart"
          style="width:180px;margin-bottom:1.5rem;"
        >
        <h2>Your cart is empty</h2>
        <p>Add products to start shopping.</p>
        <a href="/products" class="btn btn-primary" style="margin-top:2rem;">
            Continue Shopping
        </a>
      </div>
    `;

    updateSummary(0);

    return;
  }

  let subtotal = 0;

  cart.forEach((product) => {
    subtotal += product.price * product.quantity;

    cartContainer.innerHTML += `
      <div class="card cart-item">

        <img src="${product.image}" alt="${product.name}">

        <div class="cart-item-details">

          <h3>${product.name}</h3>

          <div class="current-price">
            ₹${product.price.toLocaleString()}
          </div>

        </div>

        <div class="quantity-selector">

          <button
            class="decrease"
            data-id="${product.id}">
            −
          </button>

          <input
            class="quantity-input"
            value="${product.quantity}"
            readonly>

          <button
            class="increase"
            data-id="${product.id}">
            +
          </button>

        </div>

        <button
          class="remove-item btn btn-secondary"
          data-id="${product.id}">
          Remove
        </button>

      </div>
    `;
  });

  updateSummary(subtotal);

  initializeQuantityButtons();
  initializeRemoveButtons();
}

/* =====================================
   Quantity Buttons
===================================== */

function initializeQuantityButtons() {
  document.querySelectorAll(".increase").forEach((button) => {
    button.onclick = () => {
      let cart = JSON.parse(localStorage.getItem("cloudcart-cart")) || [];

      const item = cart.find((p) => p.id == button.dataset.id);

      if (item) item.quantity++;

      localStorage.setItem("cloudcart-cart", JSON.stringify(cart));

      updateCartCount();

      renderCart();
    };
  });

  document.querySelectorAll(".decrease").forEach((button) => {
    button.onclick = () => {
      let cart = JSON.parse(localStorage.getItem("cloudcart-cart")) || [];

      const item = cart.find((p) => p.id == button.dataset.id);

      if (!item) return;

      item.quantity--;

      if (item.quantity <= 0) {
        cart = cart.filter((p) => p.id != button.dataset.id);
      }

      localStorage.setItem("cloudcart-cart", JSON.stringify(cart));

      updateCartCount();

      renderCart();
    };
  });
}

/* =====================================
   Remove Item
===================================== */

function initializeRemoveButtons() {
  document.querySelectorAll(".remove-item").forEach((button) => {
    button.onclick = () => {
      let cart = JSON.parse(localStorage.getItem("cloudcart-cart")) || [];

      cart = cart.filter((p) => p.id != button.dataset.id);

      localStorage.setItem("cloudcart-cart", JSON.stringify(cart));

      updateCartCount();

      renderCart();
    };
  });
}

/* =====================================
   Order Summary
===================================== */

function updateSummary(subtotal) {
  const tax = Math.round(subtotal * 0.18);

  const total = subtotal + tax;

  const subtotalElement = document.getElementById("subtotal");
  const taxElement = document.getElementById("tax");
  const totalElement = document.getElementById("total");

  if (subtotalElement)
    subtotalElement.textContent = "₹" + subtotal.toLocaleString();

  if (taxElement) taxElement.textContent = "₹" + tax.toLocaleString();

  if (totalElement) totalElement.textContent = "₹" + total.toLocaleString();
}

/* =====================================
   Navbar Cart Count
===================================== */

function updateCartCount() {
  const cart = JSON.parse(localStorage.getItem("cloudcart-cart")) || [];

  const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);

  const cartCount = document.getElementById("cart-count");

  if (cartCount) {
    cartCount.textContent = totalItems;
  }
}

/* =====================================
   Checkout
===================================== */

function initializeCheckout() {
  const checkoutButton = document.getElementById("checkout-btn");

  if (!checkoutButton) return;

  checkoutButton.addEventListener("click", () => {
    const cart = JSON.parse(localStorage.getItem("cloudcart-cart")) || [];

    if (cart.length === 0) {
      alert("Your cart is empty.");

      return;
    }

    completeCheckout();
  });
}

function completeCheckout() {
  const orderNumber = "#CC" + Math.floor(100000 + Math.random() * 900000);

  const receipt = {
    orderId: orderNumber,
    orderDate: new Date().toLocaleDateString("en-IN"),
    orderTime: new Date().toLocaleTimeString("en-IN"),
    subtotal: document.getElementById("subtotal").textContent,
    shipping: "FREE",
    tax: document.getElementById("tax").textContent,
    total: document.getElementById("total").textContent,
  };

  localStorage.setItem("cloudcart-last-order", JSON.stringify(receipt));

  localStorage.removeItem("cloudcart-cart");

  updateCartCount();

  const cartContainer = document.getElementById("cart-items");

  cartContainer.innerHTML = `
      <div class="card empty-cart-card">

          <img
              src="/static/images/illustrations/order-confirm.png"
              alt="Order Confirmed"
              style="width:180px; margin-bottom:2rem;">

          <h2>Order Confirmed!</h2>

          <p>
          Your order has been placed successfully.
          A confirmation has been generated and your items are now being prepared for shipment.
          Thank you for choosing CloudCart.
          </p>

          <div style="margin-top:1.5rem; line-height:2;">

          <p>
              <strong>Order ID:</strong> ${receipt.orderId}
          </p>
      
          <p>
              <strong>Order Date:</strong> ${receipt.orderDate}
          </p>
      
          <p>
              <strong>Order Time:</strong> ${receipt.orderTime}
          </p>
      
      </div>

          <a
              href="/products"
              class="btn btn-primary"
              style="margin-top:2rem; min-width:220px;">

              Continue Shopping

          </a>

      </div>
  `;

  const savedReceipt = JSON.parse(localStorage.getItem("cloudcart-last-order"));

  if (savedReceipt) {
    document.getElementById("subtotal").textContent = savedReceipt.subtotal;

    document.getElementById("tax").textContent = savedReceipt.tax;

    document.getElementById("total").textContent = savedReceipt.total;
  }

  const checkoutButton = document.getElementById("checkout-btn");

  if (checkoutButton) {
    checkoutButton.style.display = "none";
  }

  const summaryTitle = document.getElementById("summary-title");

  if (summaryTitle) {
    summaryTitle.textContent = "Order Receipt";
  }

  const paymentStatus = document.getElementById("payment-status");

  if (paymentStatus) {
    paymentStatus.innerHTML = "Paid ✓";
  }
}
