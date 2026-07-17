/*
=========================================
CloudCart Product Catalog
Version 2
=========================================
*/

const products = [
  // =====================================
  // 1. MacBook Air M3
  // =====================================

  {
    id: 1,

    name: "MacBook Air M3",

    brand: "Apple",

    brandCountry: "USA",

    category: "Laptops",

    badge: "Best Seller",

    rating: 4.9,

    reviews: 2841,

    priceINR: 94999,

    priceUSD: 1099,

    originalPriceINR: 104999,

    discount: 10,

    image: "images/products/macbook-air-m3.jpg",

    description:
      "Powerful and ultra-light laptop featuring Apple's M3 chip, exceptional battery life, and a stunning Liquid Retina display.",

    specifications: [
      "Apple M3 Chip",
      "16 GB Unified Memory",
      "512 GB SSD",
      "13.6-inch Liquid Retina Display",
      "18 Hours Battery Life",
    ],
  },

  // =====================================
  // 2. Dell XPS 13
  // =====================================

  {
    id: 2,

    name: "Dell XPS 13",

    brand: "Dell",

    brandCountry: "USA",

    category: "Laptops",

    badge: "Premium",

    rating: 4.8,

    reviews: 1932,

    priceINR: 99999,

    priceUSD: 1149,

    originalPriceINR: 109999,

    discount: 9,

    image: "images/products/dell-xps-13.jpg",

    description:
      "Premium Windows ultrabook with an InfinityEdge display and lightweight aluminum chassis.",

    specifications: [
      "Intel Core Ultra 7",
      "16 GB LPDDR5X RAM",
      "512 GB SSD",
      "13.4-inch OLED Display",
      "Windows 11 Pro",
    ],
  },

  // =====================================
  // 3. Lenovo ThinkPad X1 Carbon
  // =====================================

  {
    id: 3,

    name: "Lenovo ThinkPad X1 Carbon",

    brand: "Lenovo",

    brandCountry: "China",

    category: "Laptops",

    badge: "Business Choice",

    rating: 4.8,

    reviews: 1543,

    priceINR: 119999,

    priceUSD: 1379,

    originalPriceINR: 129999,

    discount: 8,

    image: "images/products/thinkpad-x1-carbon.jpg",

    description:
      "Professional business laptop with military-grade durability and exceptional keyboard experience.",

    specifications: [
      "Intel Core Ultra 7",
      "32 GB RAM",
      "1 TB SSD",
      "14-inch 2.8K OLED",
      "Fingerprint Reader",
    ],
  },

  // =====================================
  // 4. iPhone 16 Pro
  // =====================================

  {
    id: 4,

    name: "iPhone 16 Pro",

    brand: "Apple",

    brandCountry: "USA",

    category: "Smartphones",

    badge: "New Arrival",

    rating: 4.9,

    reviews: 4128,

    priceINR: 119900,

    priceUSD: 1399,

    originalPriceINR: 129900,

    discount: 8,

    image: "images/products/iphone-16-pro.jpg",

    description:
      "Apple's latest flagship smartphone featuring cutting-edge performance, professional cameras, and AI-powered features.",

    specifications: [
      "A19 Pro Chip",
      "256 GB Storage",
      "48 MP Triple Camera",
      "6.3-inch Super Retina XDR",
      "USB-C",
    ],
  },

  // =====================================
  // 5. Samsung Galaxy S25 Ultra
  // =====================================

  {
    id: 5,

    name: "Samsung Galaxy S25 Ultra",

    brand: "Samsung",

    brandCountry: "South Korea",

    category: "Smartphones",

    badge: "Flagship",

    rating: 4.9,

    reviews: 3568,

    priceINR: 112999,

    priceUSD: 1299,

    originalPriceINR: 122999,

    discount: 8,

    image: "images/products/galaxy-s25-ultra.jpg",

    description:
      "Samsung's flagship smartphone with Galaxy AI, an advanced camera system, and exceptional performance.",

    specifications: [
      "Snapdragon 8 Elite",
      "12 GB RAM",
      "512 GB Storage",
      "200 MP Camera",
      "6.9-inch Dynamic AMOLED",
    ],
  },

  // =====================================
  // 6. Google Pixel
  // =====================================

  {
    id: 6,

    name: "Google Pixel",

    brand: "Google",

    brandCountry: "USA",

    category: "Smartphones",

    badge: "AI Camera",

    rating: 4.8,

    reviews: 2145,

    priceINR: 79999,

    priceUSD: 899,

    originalPriceINR: 85999,

    discount: 7,

    image: "images/products/google-pixel.jpg",

    description:
      "Google's AI-powered smartphone delivering outstanding photography and a clean Android experience.",

    specifications: [
      "Google Tensor G5",
      "12 GB RAM",
      "256 GB Storage",
      "50 MP Camera",
      "Android 16",
    ],
  },

  // =====================================
  // 7. Sony WH-1000XM6
  // =====================================

  {
    id: 7,

    name: "Sony WH-1000XM6",

    brand: "Sony",

    brandCountry: "Japan",

    category: "Accessories",

    badge: "Editor's Choice",

    rating: 4.9,

    reviews: 2871,

    priceINR: 29999,

    priceUSD: 399,

    originalPriceINR: 34999,

    discount: 14,

    image: "images/products/sony-wh1000xm6.jpg",

    description:
      "Premium wireless headphones featuring world-class active noise cancellation and immersive sound.",

    specifications: [
      "30-Hour Battery",
      "Bluetooth 5.4",
      "Active Noise Cancellation",
      "Hi-Res Audio",
      "Fast Charging",
    ],
  },

  // =====================================
  // 8. Apple AirPods Pro
  // =====================================

  {
    id: 8,

    name: "Apple AirPods Pro",

    brand: "Apple",

    brandCountry: "USA",

    category: "Accessories",

    badge: "Most Popular",

    rating: 4.8,

    reviews: 4682,

    priceINR: 22999,

    priceUSD: 249,

    originalPriceINR: 26999,

    discount: 15,

    image: "images/products/airpods-pro.jpg",

    description:
      "Premium true wireless earbuds with adaptive audio, active noise cancellation, and spatial audio.",

    specifications: [
      "USB-C Charging",
      "Adaptive Audio",
      "Spatial Audio",
      "ANC",
      "MagSafe Charging Case",
    ],
  },

  // =====================================
  // 9. Logitech MX Master 3S
  // =====================================

  {
    id: 9,

    name: "Logitech MX Master 3S",

    brand: "Logitech",

    brandCountry: "Switzerland",

    category: "Accessories",

    badge: "Professional",

    rating: 4.9,

    reviews: 3986,

    priceINR: 9999,

    priceUSD: 119,

    originalPriceINR: 11999,

    discount: 17,

    image: "images/products/logitech-mx-master-3s.jpg",

    description:
      "Flagship productivity mouse designed for developers, creators, and professionals.",

    specifications: [
      "8000 DPI Sensor",
      "USB-C Fast Charging",
      "Bluetooth + Logi Bolt",
      "Multi-Device Support",
      "70-Day Battery Life",
    ],
  },

  // =====================================
  // 10. Apple Watch Series 11
  // =====================================

  {
    id: 10,

    name: "Apple Watch Series 11",

    brand: "Apple",

    brandCountry: "USA",

    category: "Smartwatches",

    badge: "New",

    rating: 4.9,

    reviews: 2845,

    priceINR: 46999,

    priceUSD: 499,

    originalPriceINR: 51999,

    discount: 10,

    image: "images/products/apple-watch-series-11.jpg",

    description:
      "Premium smartwatch with advanced health tracking, fitness features, and seamless Apple ecosystem integration.",

    specifications: [
      "Always-On Retina Display",
      "GPS + Cellular",
      "ECG & Blood Oxygen",
      "Fast Charging",
      "Water Resistant",
    ],
  },

  // =====================================
  // 11. Samsung Galaxy Watch Ultra
  // =====================================

  {
    id: 11,

    name: "Samsung Galaxy Watch Ultra",

    brand: "Samsung",

    brandCountry: "South Korea",

    category: "Smartwatches",

    badge: "Adventure",

    rating: 4.8,

    reviews: 1968,

    priceINR: 52999,

    priceUSD: 649,

    originalPriceINR: 57999,

    discount: 9,

    image: "images/products/galaxy-watch-ultra.jpg",

    description:
      "Premium rugged smartwatch built for athletes, adventurers, and outdoor enthusiasts.",

    specifications: [
      "Super AMOLED Display",
      "Dual GPS",
      "Titanium Body",
      "100-Hour Battery",
      "Military Grade Durability",
    ],
  },

  // =====================================
  // 12. Garmin Forerunner 970
  // =====================================

  {
    id: 12,

    name: "Garmin Forerunner 970",

    brand: "Garmin",

    brandCountry: "USA",

    category: "Smartwatches",

    badge: "Runner's Choice",

    rating: 4.9,

    reviews: 1246,

    priceINR: 58999,

    priceUSD: 699,

    originalPriceINR: 64999,

    discount: 9,

    image: "images/products/garmin-forerunner-970.jpg",

    description:
      "Professional GPS running watch with advanced training analytics and long battery life.",

    specifications: [
      "AMOLED Display",
      "Advanced GPS",
      "Training Readiness",
      "30-Day Battery",
      "Heart Rate Monitoring",
    ],
  },
];
