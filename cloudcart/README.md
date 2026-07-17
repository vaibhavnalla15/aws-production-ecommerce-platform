# CloudCart – Modern Flask E-Commerce Web Application

<p align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow?style=for-the-badge&logo=javascript)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker&logoColor=white)

</p>

<p align="center">

A modern, responsive, Flask-based electronics e-commerce web application built with clean architecture, reusable Jinja components, and a premium user interface.

</p>

---

# Project Overview

CloudCart is a modern electronics shopping application developed using **Flask**, **HTML5**, **CSS3**, and **Vanilla JavaScript**.

The application demonstrates how a lightweight Python web framework can be used to build a responsive, component-driven e-commerce experience without relying on frontend frameworks such as React, Angular, or Vue.

CloudCart focuses on clean UI design, reusable templates, responsive layouts, shopping cart functionality, product browsing, customer reviews, and an administrative dashboard.

This repository contains the complete frontend application that can be executed locally or inside a Docker container.

---

# Features

## Shopping Experience

- Modern responsive landing page
- Featured product showcase
- Product catalog
- Product detail pages
- Product search
- Category filtering
- Product specifications
- Product descriptions
- Related products

---

## Shopping Cart

- Add products to cart
- Remove products
- Update product quantity
- Live order summary
- Checkout workflow
- Order confirmation page
- Order receipt
- Local browser storage

---

## Customer Experience

- Customer reviews page
- Featured testimonials
- Premium UI animations
- Responsive design
- Newsletter section
- Modern navigation
- Elegant footer

---

## Admin Dashboard

- Dashboard overview
- KPI cards
- Revenue statistics
- Sales analytics
- Recent orders
- Responsive admin interface

---

## Technical Features

- Flask application
- Jinja2 template inheritance
- Reusable UI components
- Responsive CSS
- Modular JavaScript
- Docker support
- Production-ready project structure

---

# Technology Stack

| Category         | Technologies                    |
| ---------------- | ------------------------------- |
| Backend          | Python, Flask                   |
| Frontend         | HTML5, CSS3, Vanilla JavaScript |
| Templating       | Jinja2                          |
| Styling          | Custom CSS                      |
| Containerization | Docker                          |
| Version Control  | Git & GitHub                    |

---

# Application Features

- Responsive Landing Page
- Premium Hero Banner
- Featured Categories
- Product Catalog
- Product Search
- Category Filtering
- Product Detail View
- Product Specifications
- Customer Reviews
- Shopping Cart
- Checkout Flow
- Order Confirmation
- Order Receipt
- Admin Dashboard
- Error Pages
- Mobile Responsive Design
- Dockerized Deployment

---

# Project Structure

```text
cloudcart/
│
├── app.py
├── Dockerfile
├── requirements.txt
├── .dockerignore
├── README.md
│
├── assets/
│   └── screenshots/
│       ├── admin-dashboard/
│       ├── cart-page/
│       ├── home-page/
│       ├── order-confirmation-page/
│       ├── product-details-page/
│       ├── products-page/
│       └── reviews-page/
│
├── static/
│   ├── css/
│   ├── data/
│   ├── fonts/
│   ├── images/
│   │   ├── avatars/
│   │   ├── banners/
│   │   ├── categories/
│   │   ├── hero/
│   │   ├── icons/
│   │   ├── illustrations/
│   │   ├── logo/
│   │   └── products/
│   └── js/
│
└── templates/
    ├── components/
    ├── errors/
    ├── admin.html
    ├── base.html
    ├── cart.html
    ├── home.html
    ├── product.html
    ├── products.html
    └── reviews.html
```

---

# User Interface

CloudCart follows a modern design philosophy inspired by premium technology brands.

### Design Highlights

- Clean minimal interface
- Premium typography
- Smooth animations
- Consistent spacing
- Modern color palette
- Responsive layouts
- Reusable components
- Professional user experience

---

# Responsive Design

The application is fully responsive across different screen sizes.

Supported devices include:

- Desktop
- Laptop
- Tablet
- Mobile

Responsive layouts are implemented using custom CSS without external UI frameworks.

---

# Screenshots:-

## Home Page

### Hero Section

![Home Hero](assets/screenshots/home-page/01-home-hero.png)

---

### Features

![Home Features](assets/screenshots/home-page/02-home-features.png)

---

### Categories

![Categories](assets/screenshots/home-page/03-home-categories.png)

---

### Featured Products

![Featured Products](assets/screenshots/home-page/04-home-featured-products.png)

---

### Customer Reviews

![Customer Reviews](assets/screenshots/home-page/05-home-customer-reviews.png)

---

### Footer

![Footer](assets/screenshots/home-page/06-home-footer.png)

---

## Products Page:-

### Product Catalog

![Products](assets/screenshots/products-page/01-products-hero.png)

---

### Browse Products

![Browse Products](assets/screenshots/products-page/02-products-all.png)

---

### Product Search

![Search iPhone](assets/screenshots/products-page/03-products-search-iphone.png)

![Search Sony](assets/screenshots/products-page/04-products-search-sony.png)

---

### Category Filters

![Laptops](assets/screenshots/products-page/05-products-filter-laptops.png)

![Smartphones](assets/screenshots/products-page/06-products-filter-smartphones.png)

![Accessories](assets/screenshots/products-page/07-products-filter-accessories.png)

![Smartwatches](assets/screenshots/products-page/08-products-filter-smartwatches.png)

---

## Product Details:-

### Product Overview

![Product Overview](assets/screenshots/product-details-page/01-product-overview.png)

---

### Product Description

![Product Description](assets/screenshots/product-details-page/02-product-description.png)

---

### Product Specifications

![Product Specifications](assets/screenshots/product-details-page/03-product-specifications.png)

---

### Related Products

![Related Products](assets/screenshots/product-details-page/04-product-related-products.png)

---

# Shopping Cart:-

CloudCart includes a complete client-side shopping cart experience.

### Features

- Add products to cart
- Remove products
- Update product quantity
- Dynamic order summary
- Automatic total calculation
- Local browser storage
- Checkout workflow

---

### Empty Cart

![Empty Cart](assets/screenshots/cart-page/01-cart-empty.png)

---

### Cart with Products

![Cart](assets/screenshots/cart-page/02-cart-with-products.png)

---

### Quantity Update

![Quantity Update](assets/screenshots/cart-page/03-cart-quantity-update.png)

---

### Order Summary

![Order Summary](assets/screenshots/cart-page/04-cart-order-summary.png)

---

# Order Confirmation:-

After checkout, CloudCart generates a confirmation page and displays an order receipt.

---

### Order Confirmation

![Order Confirmation](assets/screenshots/order-confirmation-page/01-order-confirmation.png)

---

### Order Receipt

![Order Receipt](assets/screenshots/order-confirmation-page/02-order-receipt.png)

---

# Customer Reviews:-

The application includes a dedicated customer reviews page featuring realistic customer testimonials.

---

### Reviews Page

![Reviews](assets/screenshots/reviews-page/01-reviews-hero.png)

---

### Customer Testimonials

![All Reviews](assets/screenshots/reviews-page/02-all-customer-reviews.png)

---

# Admin Dashboard:-

CloudCart provides a modern administrative dashboard for monitoring business metrics.

### Dashboard Features

- KPI cards
- Revenue overview
- Sales analytics
- Recent orders
- Responsive dashboard

---

### Dashboard Overview

![Dashboard Overview](assets/screenshots/admin-dashboard/01-admin-overview.png)

---

### KPI Cards

![KPI Cards](assets/screenshots/admin-dashboard/02-admin-kpi-cards.png)

---

### Sales Analytics

![Sales Analytics](assets/screenshots/admin-dashboard/03-admin-sales-analytics.png)

---

### Recent Orders

![Recent Orders](assets/screenshots/admin-dashboard/04-admin-recent-orders.png)

---

### Dashboard Footer

![Dashboard Footer](assets/screenshots/admin-dashboard/05-admin-footer.png)

---

# Getting Started:-

## Prerequisites

Install the following before running the project:

- Python 3.13 or later
- Git
- Docker Desktop (optional)

---

# Clone Repository

```bash
git clone https://github.com/vaibhavnalla15/aws-production-ecommerce-platform cloudcart

cd cloudcart
```

---

# Create Virtual Environment

### Windows

```bash
python -m venv venv

venv\Scripts\activate
```

### Linux / macOS

```bash
python3 -m venv venv

source venv/bin/activate
```

---

# Install Dependencies

```bash
pip install -r requirements.txt
```

---

# Run the Application

```bash
python app.py
```

Open your browser:

```text
http://localhost:5000
```

---

# Docker

CloudCart is fully containerized using Docker.

---

## Build Docker Image

```bash
docker build -t cloudcart:v1 .
```

> Run this at the root folder where dokerfile is present

---

## Verify Image

```bash
docker images
```

---

## Run Container

```bash
docker run -d --name cloudcart-app -p 5000:5000 cloudcart:v1
```

---

## Verify Running Container

```bash
docker ps
```

---

## Stop Container

```bash
docker stop cloudcart-app
```

---

## Remove Container

```bash
docker rm cloudcart-app
```

---

## Docker Hub

To publish your own Docker image:

```bash
docker login
```

```bash
docker tag cloudcart:v1 <your-dockerhub-username>/cloudcart:v1
```

```bash
docker push <your-dockerhub-username>/cloudcart:v1
```

To pull an existing image:

```bash
docker pull <your-dockerhub-username>/cloudcart:v1
```

Run the pulled image:

```bash
docker run -d -p 5000:5000 <your-dockerhub-username>/cloudcart:v1
```

---

# Application Workflow

```text
Home
    │
    ▼
Browse Products
    │
    ▼
Search / Filter Products
    │
    ▼
View Product Details
    │
    ▼
Add to Cart
    │
    ▼
Update Quantity
    │
    ▼
Checkout
    │
    ▼
Order Confirmation
    │
    ▼
Order Receipt
```

# Application Architecture

CloudCart follows a lightweight Model-View-Template (MVT-inspired) architecture using Flask and Jinja2, separating application logic, presentation, and static assets for better maintainability.

```text
                        User Browser
                              │
                              ▼
                     Flask Application
                          (app.py)
                              │
         ┌────────────────────┼────────────────────┐
         │                    │                    │
         ▼                    ▼                    ▼
    Product Data         Flask Routes        Business Logic
                              │
                              ▼
                     Jinja2 Templates
                              │
              ┌───────────────┼───────────────┐
              │               │               │
              ▼               ▼               ▼
        Base Template     Components      Page Templates
              │               │               │
              └───────────────┼───────────────┘
                              │
                              ▼
                    HTML Rendered Response
                              │
         ┌────────────────────┼────────────────────┐
         │                    │                    │
         ▼                    ▼                    ▼
      CSS Styling      JavaScript Logic     Static Images
                              │
                              ▼
                     Local Storage (Cart)
                              │
                              ▼
                         User Interface
```

### Flask

Flask serves as the backend web framework responsible for:

- Managing application routes
- Rendering HTML templates
- Loading product data
- Handling page navigation
- Serving static assets

---

### Jinja2 Templates

Jinja2 enables reusable layouts through template inheritance and modular components.

The application uses:

- Base layout
- Shared navigation
- Shared footer
- Product cards
- Review cards
- Dashboard cards
- Category cards
- Newsletter section

This approach minimizes duplicate code while improving maintainability.

---

### CSS

Custom CSS is organized into multiple files for better scalability.

- Variables
- Global styles
- Components
- Animations
- Responsive layouts

The design system ensures visual consistency across every page.

---

### JavaScript

Vanilla JavaScript provides client-side interactivity including:

- Product search
- Category filtering
- Shopping cart
- Quantity updates
- Checkout workflow
- UI interactions
- Animations

No external JavaScript frameworks are used.

---

### Local Storage

Shopping cart information is stored locally in the browser using Local Storage.

Stored data includes:

- Selected products
- Product quantities
- Cart totals
- Last completed order

This allows the shopping experience to persist across page refreshes without requiring a database.

---

# Key Components:-

CloudCart is built using reusable Jinja2 components to promote consistency and simplify maintenance.

| Component      | Purpose                                                   |
| -------------- | --------------------------------------------------------- |
| Navbar         | Global navigation and shopping cart access                |
| Footer         | Common footer displayed across all pages                  |
| Product Card   | Displays products in catalog and related product sections |
| Category Card  | Displays product categories on the home page              |
| Review Card    | Displays customer testimonials                            |
| Dashboard Card | Displays administrative dashboard metrics                 |
| Statistic Card | Shows KPI and analytics information                       |
| Newsletter     | Newsletter subscription section                           |
| Base Template  | Shared layout inherited by all pages                      |

This component-driven architecture keeps the UI modular and reduces duplicated markup throughout the project.

---

# Browser Compatibility:-

CloudCart is designed to work across all modern desktop and mobile browsers.

| Browser         | Supported |
| --------------- | --------- |
| Google Chrome   | ✅        |
| Microsoft Edge  | ✅        |
| Mozilla Firefox | ✅        |
| Safari          | ✅        |
| Brave           | ✅        |

The application uses modern HTML5, CSS3, and JavaScript features supported by current browser versions.

---

# Performance Optimizations:-

Several optimizations have been incorporated to improve responsiveness and maintainability.

### Frontend

- Modular CSS architecture
- Reusable Jinja2 components
- Organized static assets
- Optimized image organization
- Responsive layouts
- Lightweight Vanilla JavaScript
- No external frontend frameworks

---

### Application

- Simple Flask routing
- Template inheritance
- Reusable page components
- Clean project structure
- Efficient static asset serving

---

### User Experience

- Fast page rendering
- Smooth CSS animations
- Responsive navigation
- Dynamic product filtering
- Instant cart updates
- Persistent shopping cart using Local Storage
- Consistent user interface across all pages

---

# Future Enhancements:-

Potential improvements for future versions include:

- User authentication
- Customer accounts
- Wishlist functionality
- Product inventory management
- Product ratings and reviews
- Payment gateway integration
- Order history
- Admin authentication
- Product management dashboard
- Database integration
- REST API backend
- Cloud deployment
- CI/CD pipeline
- Automated testing

---

# Contributing

Contributions are welcome.

If you would like to improve CloudCart:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Push the branch.
5. Open a Pull Request.

---

# License

This project is licensed under the MIT License.

Feel free to use this project for learning, experimentation, and personal portfolio development.

---

# Acknowledgments

This project was created as part of a hands-on cloud engineering and software development learning journey.

Special focus was placed on:

- Clean project structure
- Maintainable code organization
- Responsive user interface design
- Docker-based development
- Professional GitHub documentation
- Portfolio-quality implementation

---

# Repository Overview

```text
Application
│
├── Flask Backend
├── Jinja Templates
├── Responsive UI
├── Product Catalog
├── Product Details
├── Search & Filtering
├── Shopping Cart
├── Checkout
├── Customer Reviews
├── Admin Dashboard
└── Docker Support
```

---

# Quick Start

```bash
git clone https://github.com/vaibhavnalla15/aws-production-ecommerce-platform cloudcart

cd cloudcart

python -m venv venv

# Windows
venv\Scripts\activate

# Linux / macOS
source venv/bin/activate

pip install -r requirements.txt

python app.py
```

Open your browser:

```text
http://localhost:5000
```

---

# Author

Developed as a portfolio project to demonstrate modern Flask web application development, responsive frontend engineering, reusable component architecture, and Docker-based application deployment.

---

<div align="center">

## CloudCart

**Modern • Responsive • Flask • Docker • Portfolio Project**

Built with Python, Flask, HTML5, CSS3, Vanilla JavaScript, and Docker.

</div>
