from flask import Flask, render_template

app = Flask(__name__)


# =========================================
# Demo Product Catalog
# =========================================

product_catalog = [
    {
        "id": 1,
        "name": "MacBook Air M3",
        "category": "Laptops",
        "price_inr": 94999,
        "price_usd": 1099,
        "original_price_inr": 104999,
        "rating": 4.9,
        "image": "images/products/MacBook-Air-M3.jpg",
        "description": "MacBook Air M3 is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "MacBook",
                "Display": "13-inch Display",
                "Processor": "Latest Generation Processor",
                "Memory": "16 GB",
                "Storage": "512 GB SSD",
                "Battery": "Up to 18 hours",
                "Operating System": "Latest OS",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 2,
        "name": "Dell XPS 13",
        "category": "Laptops",
        "price_inr": 99999,
        "price_usd": 1149,
        "original_price_inr": 109999,
        "rating": 4.8,
        "image": "images/products/Dell-XPS-13.jpg",
        "description": "Dell XPS 13 is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Dell",
                "Display": "13-inch Display",
                "Processor": "Latest Generation Processor",
                "Memory": "16 GB",
                "Storage": "512 GB SSD",
                "Battery": "Up to 18 hours",
                "Operating System": "Latest OS",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 3,
        "name": "Lenovo ThinkPad X1 Carbon",
        "category": "Laptops",
        "price_inr": 119999,
        "price_usd": 1379,
        "original_price_inr": 129999,
        "rating": 4.8,
        "image": "images/products/Lenovo-ThinkPad-X1-Carbon.jpg",
        "description": "Lenovo ThinkPad X1 Carbon is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Lenovo",
                "Display": "13-inch Display",
                "Processor": "Latest Generation Processor",
                "Memory": "16 GB",
                "Storage": "512 GB SSD",
                "Battery": "Up to 18 hours",
                "Operating System": "Latest OS",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 4,
        "name": "iPhone 16 Pro",
        "category": "Smartphones",
        "price_inr": 119900,
        "price_usd": 1399,
        "original_price_inr": 129900,
        "rating": 4.9,
        "image": "images/products/iPhone-16-Pro.jpg",
        "description": "iPhone 16 Pro is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "iPhone",
                "Display": "6.7-inch OLED",
                "Processor": "Flagship Chipset",
                "Storage": "256 GB",
                "Camera": "Triple Rear Camera",
                "Battery": "5000 mAh",
                "Connectivity": "5G, Wi-Fi, Bluetooth",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 5,
        "name": "Samsung Galaxy S25 Ultra",
        "category": "Smartphones",
        "price_inr": 112999,
        "price_usd": 1299,
        "original_price_inr": 122999,
        "rating": 4.9,
        "image": "images/products/Samsung-Galaxy-S25-Ultra.jpg",
        "description": "Samsung Galaxy S25 Ultra is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Samsung",
                "Display": "6.7-inch OLED",
                "Processor": "Flagship Chipset",
                "Storage": "256 GB",
                "Camera": "Triple Rear Camera",
                "Battery": "5000 mAh",
                "Connectivity": "5G, Wi-Fi, Bluetooth",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 6,
        "name": "Google Pixel",
        "category": "Smartphones",
        "price_inr": 79999,
        "price_usd": 899,
        "original_price_inr": 85999,
        "rating": 4.8,
        "image": "images/products/Google-Pixel.jpg",
        "description": "Google Pixel is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Google",
                "Display": "6.7-inch OLED",
                "Processor": "Flagship Chipset",
                "Storage": "256 GB",
                "Camera": "Triple Rear Camera",
                "Battery": "5000 mAh",
                "Connectivity": "5G, Wi-Fi, Bluetooth",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 7,
        "name": "Sony WH-1000XM6",
        "category": "Accessories",
        "price_inr": 29999,
        "price_usd": 399,
        "original_price_inr": 34999,
        "rating": 4.9,
        "image": "images/products//Sony-WH-1000XM6.jpg",
        "description": "Sony WH-1000XM6 is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Sony",
                "Connectivity": "Bluetooth 5.3",
                "Battery Life": "Up to 30 hours",
                "Noise Cancellation": "Active",
                "Charging": "USB-C",
                "Weight": "Lightweight",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 8,
        "name": "Apple AirPods Pro",
        "category": "Accessories",
        "price_inr": 22999,
        "price_usd": 249,
        "original_price_inr": 26999,
        "rating": 4.8,
        "image": "images/products/Apple-AirPods-Pro.jpg",
        "description": "Apple AirPods Pro is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Apple",
                "Connectivity": "Bluetooth 5.3",
                "Battery Life": "Up to 30 hours",
                "Noise Cancellation": "Active",
                "Charging": "USB-C",
                "Weight": "Lightweight",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 9,
        "name": "Logitech MX Master 3S",
        "category": "Accessories",
        "price_inr": 9999,
        "price_usd": 119,
        "original_price_inr": 11999,
        "rating": 4.9,
        "image": "images/products/Logitech-MX-Master-3S.jpg",
        "description": "Logitech MX Master 3S is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Logitech",
                "Connectivity": "Bluetooth, USB Receiver",
                "Sensor": "High Precision Optical",
                "Buttons": "7",
                "Battery": "Up to 70 days",
                "Compatibility": "Windows, macOS, Linux",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 10,
        "name": "Apple Watch Series 11",
        "category": "Smartwatches",
        "price_inr": 46999,
        "price_usd": 499,
        "original_price_inr": 51999,
        "rating": 4.9,
        "image": "images/products/Apple-Watch-Series-11.jpg",
        "description": "Apple Watch Series 11 is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Apple",
                "Display": "AMOLED",
                "Health Tracking": "Heart Rate, Sleep",
                "Battery": "Up to 14 days",
                "GPS": "Built-in",
                "Water Resistance": "5 ATM",
                "Compatibility": "Android, iOS",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 11,
        "name": "Samsung Galaxy Watch Ultra",
        "category": "Smartwatches",
        "price_inr": 52999,
        "price_usd": 649,
        "original_price_inr": 57999,
        "rating": 4.8,
        "image": "images/products/Samsung-Galaxy-Watch-Ultra.jpg",
        "description": "Samsung Galaxy Watch Ultra is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Samsung",
                "Display": "AMOLED",
                "Health Tracking": "Heart Rate, Sleep",
                "Battery": "Up to 14 days",
                "GPS": "Built-in",
                "Water Resistance": "5 ATM",
                "Compatibility": "Android, iOS",
                "Warranty": "1 Year"
            },
    },
    {
        "id": 12,
        "name": "Garmin Forerunner 970",
        "category": "Smartwatches",
        "price_inr": 58999,
        "price_usd": 699,
        "original_price_inr": 64999,
        "rating": 4.9,
        "image": "images/products/Garmin-Forerunner-970.jpg",
        "description": "Garmin Forerunner 970 is designed for users who value reliable performance and refined design. It delivers a balanced experience for everyday work and entertainment while maintaining the quality expected from its category. The product is suitable for both personal and professional use.",
        "specifications": {
                "Brand": "Garmin",
                "Display": "AMOLED",
                "Health Tracking": "Heart Rate, Sleep",
                "Battery": "Up to 14 days",
                "GPS": "Built-in",
                "Water Resistance": "5 ATM",
                "Compatibility": "Android, iOS",
                "Warranty": "1 Year"
            },
    },
]


@app.route("/")
def home():
    return render_template(
        "home.html",
        products=product_catalog
    )


@app.route("/products")
def products():
    return render_template(
        "products.html",
        products=product_catalog
    )


@app.route("/product/<int:product_id>")
def product(product_id):

    selected_product = next(
        (product for product in product_catalog if product["id"] == product_id),
        None
    )

    return render_template(
        "product.html",
        product=selected_product,
        products=product_catalog
    )


@app.route("/cart")
def cart():
    return render_template("cart.html")

@app.route("/reviews")
def reviews():
    return render_template("reviews.html")

@app.route("/admin")
def admin():
    return render_template("admin.html")


@app.errorhandler(404)
def page_not_found(error):
    return render_template("errors/404.html"), 404


@app.errorhandler(500)
def internal_server_error(error):
    return render_template("errors/500.html"), 500


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True
    )