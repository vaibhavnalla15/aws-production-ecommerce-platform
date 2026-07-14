from flask import Flask, render_template

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("home.html")


@app.route("/products")
def products():
    return render_template("products.html")


@app.route("/product/<int:product_id>")
def product(product_id):
    return render_template(
        "product.html",
        product_id=product_id
    )


@app.route("/cart")
def cart():
    return render_template("cart.html")


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
    app.run(host="0.0.0.0", port=5000, debug=True)