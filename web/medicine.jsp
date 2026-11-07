
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Medicine" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>MediNest | Online Pharmacy</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #f7fafb;
    color: #263238;
}


/* =====================================================
   TOP OFFER BAR
   ===================================================== */

.top-bar {
    background: #087f79;
    color: white;
    text-align: center;
    padding: 9px;
    font-size: 13px;
    letter-spacing: .3px;
}


/* =====================================================
   NAVBAR
   ===================================================== */

.navbar {
    height: 76px;
    background: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 6%;
    box-shadow: 0 2px 12px rgba(0,0,0,.07);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.brand {
    font-size: 30px;
    font-weight: 800;
    color: #087f79;
}

.brand span {
    color: #ff8c00;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 28px;
}

.nav-links a {
    text-decoration: none;
    color: #37474f;
    font-size: 14px;
    font-weight: 600;
}

.nav-links a:hover {
    color: #087f79;
}

.nav-cart {
    background: #087f79;
    color: white !important;
    padding: 11px 20px;
    border-radius: 8px;
}

.nav-cart:hover {
    background: #056963;
}


/* =====================================================
   HERO
   ===================================================== */

.hero {
    min-height: 480px;

    background-image:
        linear-gradient(
            90deg,
            rgba(4,74,70,.92),
            rgba(4,74,70,.65),
            rgba(4,74,70,.25)
        ),
        url("images/pharmacy-background.jpg");

    background-size: cover;
    background-position: center;

    display: flex;
    align-items: center;

    padding: 50px 7%;
}

.hero-content {
    max-width: 650px;
    color: white;
}

.hero-small {
    font-size: 14px;
    font-weight: bold;
    letter-spacing: 2px;
    margin-bottom: 15px;
    color: #b8efeb;
}

.hero h1 {
    font-size: 52px;
    line-height: 1.08;
    margin-bottom: 20px;
}

.hero h1 span {
    color: #ffb347;
}

.hero-description {
    font-size: 18px;
    line-height: 1.6;
    margin-bottom: 28px;
    color: #e8f6f5;
}


/* =====================================================
   SEARCH
   ===================================================== */

.search-box {
    background: white;
    width: 100%;
    max-width: 650px;
    height: 62px;
    border-radius: 12px;
    display: flex;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0,0,0,.25);
}

.search-box input {
    flex: 1;
    border: none;
    outline: none;
    padding: 0 20px;
    font-size: 16px;
}

.search-box input::placeholder {
    color: #999;
}

.search-box button {
    width: 130px;
    border: none;
    background: #ff8c00;
    color: white;
    font-weight: bold;
    font-size: 15px;
    cursor: pointer;
}

.search-box button:hover {
    background: #e77d00;
}

.clear-button {
    display: none;
    margin-top: 12px;
    background: rgba(255,255,255,.15);
    color: white;
    border: 1px solid rgba(255,255,255,.5);
    padding: 8px 15px;
    border-radius: 7px;
    cursor: pointer;
    font-size: 13px;
}

.clear-button:hover {
    background: rgba(255,255,255,.25);
}


/* =====================================================
   TRUST STRIP
   ===================================================== */

.trust-strip {
    background: white;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    padding: 22px 7%;
    box-shadow: 0 3px 15px rgba(0,0,0,.06);
}

.trust {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 10px 20px;
    border-right: 1px solid #eee;
}

.trust:last-child {
    border-right: none;
}

.trust-icon {
    font-size: 27px;
}

.trust strong {
    display: block;
    font-size: 14px;
    margin-bottom: 4px;
}

.trust small {
    color: #777;
}


/* =====================================================
   SECTION
   ===================================================== */

.section {
    padding: 45px 7% 10px;
}

.section-heading {
    display: flex;
    align-items: end;
    justify-content: space-between;
    margin-bottom: 25px;
}

.section-heading h2 {
    font-size: 28px;
}

.section-heading p {
    color: #777;
    margin-top: 6px;
}


/* =====================================================
   CATEGORY CARDS
   ===================================================== */

.category-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.category-card {
    height: 145px;
    border-radius: 14px;
    position: relative;
    overflow: hidden;
    cursor: pointer;
    background: white;
    box-shadow: 0 4px 15px rgba(0,0,0,.08);
    transition: .3s;
}

.category-card:hover {
    transform: translateY(-6px);
}

.category-card img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.category-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(
        transparent,
        rgba(0,0,0,.75)
    );
    display: flex;
    align-items: end;
    padding: 18px;
}

.category-overlay h3 {
    color: white;
    font-size: 16px;
}


/* =====================================================
   OFFER BANNER
   ===================================================== */

.offer {
    margin: 40px 7%;
    padding: 35px 45px;
    border-radius: 18px;

    background:
        linear-gradient(
            100deg,
            #e5f7f5,
            #fff3df
        );

    display: flex;
    align-items: center;
    justify-content: space-between;
}

.offer h2 {
    color: #087f79;
    font-size: 28px;
    margin-bottom: 8px;
}

.offer p {
    color: #555;
}

.offer-button {
    background: #ff8c00;
    color: white;
    border: none;
    padding: 13px 25px;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
}

.offer-button:hover {
    background: #e77d00;
}


/* =====================================================
   PRODUCT SECTION
   ===================================================== */

.products {
    padding: 25px 7% 60px;
}

.medicine-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 22px;
}


/* =====================================================
   SEARCH RESULT MESSAGE
   ===================================================== */

.search-result {
    display: none;
    text-align: center;
    background: white;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,.06);
    margin-bottom: 25px;
}

.search-result-icon {
    font-size: 45px;
    margin-bottom: 10px;
}

.search-result h3 {
    color: #087f79;
    margin-bottom: 8px;
}

.search-result p {
    color: #777;
}


/* =====================================================
   PRODUCT CARD
   ===================================================== */

.medicine-card {
    background: white;
    border-radius: 14px;
    padding: 15px;
    border: 1px solid #edf0f1;
    box-shadow: 0 4px 18px rgba(0,0,0,.06);
    position: relative;
    transition: .3s;
}

.medicine-card:hover {
    transform: translateY(-7px);
    box-shadow: 0 12px 30px rgba(0,0,0,.13);
}

.badge {
    position: absolute;
    top: 13px;
    left: 13px;
    background: #e8f7f5;
    color: #087f79;
    padding: 6px 10px;
    border-radius: 5px;
    font-size: 11px;
    font-weight: bold;
}

.image-container {
    height: 190px;
    background: #f8fafb;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 15px;
}

.medicine-image {
    width: 165px;
    height: 165px;
    object-fit: contain;
}

.medicine-card h3 {
    font-size: 17px;
    margin-bottom: 7px;
}

.category-name {
    color: #087f79;
    font-size: 12px;
    font-weight: bold;
    margin-bottom: 8px;
}

.description {
    color: #777;
    font-size: 13px;
    line-height: 1.5;
    height: 40px;
}

.manufacturer {
    color: #555;
    font-size: 12px;
    margin-top: 10px;
}

.price-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 12px;
}

.price {
    color: #087f79;
    font-size: 22px;
    font-weight: 800;
}


/* =====================================================
   STOCK
   ===================================================== */

.stock {
    font-size: 11px;
    color: #3d8a4c;
    font-weight: bold;
}

.out-of-stock {
    color: #d32f2f;
    font-weight: bold;
}


/* =====================================================
   PRODUCT BUTTONS
   ===================================================== */

.button-container {
    display: flex;
    gap: 8px;
    margin-top: 15px;
}

.cart-btn,
.buy-btn {
    flex: 1;
    padding: 11px 5px;
    border-radius: 7px;
    font-size: 12px;
    font-weight: bold;
    cursor: pointer;
}

.cart-btn {
    background: white;
    border: 1px solid #ff9800;
    color: #e57c00;
}

.cart-btn:hover {
    background: #ff9800;
    color: white;
}

.buy-btn {
    background: #087f79;
    border: 1px solid #087f79;
    color: white;
}

.buy-btn:hover {
    background: #056963;
}


/* =====================================================
   DISABLED BUTTONS
   ===================================================== */

.disabled-btn {
    background: #e0e0e0 !important;
    color: #888 !important;
    border: 1px solid #ccc !important;
    cursor: not-allowed !important;
}

.disabled-btn:hover {
    background: #e0e0e0 !important;
    color: #888 !important;
}


/* =====================================================
   WISHLIST - ADDED
   ===================================================== */

.wishlist-form {
    position: absolute;
    top: 12px;
    right: 12px;
    z-index: 20;
}

.wishlist-btn {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    border: none;
    background: white;
    color: #e53935;
    font-size: 25px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 3px 12px rgba(0,0,0,.15);
    transition: all .25s ease;
}

.wishlist-btn:hover {
    background: #fff0f0;
    transform: scale(1.12);
}


/* =====================================================
   FOOTER
   ===================================================== */

.footer {
    background: #123b39;
    color: white;
    padding: 50px 7% 20px;
}

.footer-grid {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr 1fr;
    gap: 40px;
}

.footer h2 {
    margin-bottom: 15px;
}

.footer h2 span {
    color: #ff9b2f;
}

.footer h3 {
    margin-bottom: 15px;
}

.footer p,
.footer li {
    color: #c5d5d4;
    font-size: 13px;
    line-height: 1.8;
}

.footer ul {
    list-style: none;
}

.footer-bottom {
    border-top: 1px solid rgba(255,255,255,.15);
    margin-top: 35px;
    padding-top: 20px;
    text-align: center;
    color: #aebfbd;
    font-size: 12px;
}


/* =====================================================
   RESPONSIVE
   ===================================================== */

@media(max-width: 1000px) {

    .medicine-container {
        grid-template-columns: repeat(2, 1fr);
    }

    .category-grid {
        grid-template-columns: repeat(2, 1fr);
    }

    .trust-strip {
        grid-template-columns: repeat(2, 1fr);
    }

}


@media(max-width: 650px) {

    .navbar {
        height: auto;
        padding: 15px 20px;
        flex-direction: column;
        gap: 15px;
    }

    .nav-links {
        flex-wrap: wrap;
        justify-content: center;
    }

    .hero {
        padding: 45px 20px;
    }

    .hero h1 {
        font-size: 35px;
    }

    .medicine-container,
    .category-grid {
        grid-template-columns: 1fr;
    }

    .trust-strip {
        grid-template-columns: 1fr;
    }

    .trust {
        border-right: none;
        border-bottom: 1px solid #eee;
    }

    .offer {
        margin: 30px 20px;
        padding: 25px;
        flex-direction: column;
        gap: 20px;
        text-align: center;
    }

    .footer-grid {
        grid-template-columns: 1fr;
    }

    .search-box {
        height: 55px;
    }

    .search-box button {
        width: 100px;
    }

}

</style>

</head>


<body>


<!-- =====================================================
     TOP BAR
     ===================================================== -->

<div class="top-bar">

    &#128138; Welcome to MediNest
    &#128230; Your trusted online pharmacy
    | Fast &amp; convenient healthcare shopping

</div>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar">

    <div class="brand">
        Medi<span>Nest</span>
    </div>


    <div class="nav-links">

        <a href="#">
            &#127968; Home
        </a>

        <a href="#medicines">
            Medicines
        </a>

        <a href="#categories">
            Categories
        </a>

        <a href="#">
            Orders
        </a>

        <a href="cart.jsp" class="nav-cart">
            &#128722; Cart
        </a>

    </div>

</nav>


<!-- =====================================================
     HERO
     ===================================================== -->

<section class="hero">

    <div class="hero-content">

        <div class="hero-small">
            YOUR HEALTH. OUR PRIORITY.
        </div>

        <h1>
            Everything You Need
            <span>For Better Health</span>
        </h1>

        <p class="hero-description">

            Buy medicines and healthcare products
            from the comfort of your home.

        </p>


        <!-- SEARCH BOX -->

        <div class="search-box">

            <input
                type="text"
                id="searchInput"
                placeholder="Search medicines, categories, manufacturers..."
                onkeyup="searchMedicine(false)"
            >

            <button onclick="searchMedicine(true)">
                &#128269; Search
            </button>

        </div>


        <!-- CLEAR SEARCH BUTTON -->

        <button
            id="clearSearch"
            class="clear-button"
            onclick="clearSearch()">

            &#10006; Clear Search

        </button>

    </div>

</section>


<!-- =====================================================
     TRUST STRIP
     ===================================================== -->

<div class="trust-strip">


    <div class="trust">

        <div class="trust-icon">
            &#128666;
        </div>

        <div>

            <strong>
                Fast Delivery
            </strong>

            <small>
                Quick doorstep delivery
            </small>

        </div>

    </div>


    <div class="trust">

        <div class="trust-icon">
            &#128737;&#65039;
        </div>

        <div>

            <strong>
                Genuine Medicines
            </strong>

            <small>
                Quality healthcare products
            </small>

        </div>

    </div>


    <div class="trust">

        <div class="trust-icon">
            &#128179;
        </div>

        <div>

            <strong>
                Secure Payments
            </strong>

            <small>
                Safe online shopping
            </small>

        </div>

    </div>


    <div class="trust">

        <div class="trust-icon">
            &#128172;
        </div>

        <div>

            <strong>
                Customer Support
            </strong>

            <small>
                We're here to help
            </small>

        </div>

    </div>


</div>


<!-- =====================================================
     CATEGORIES
     ===================================================== -->

<section class="section" id="categories">


    <div class="section-heading">

        <div>

            <h2>
                Shop by Category
            </h2>

            <p>
                Find what you need for your health
            </p>

        </div>

    </div>


    <div class="category-grid">


        <!-- SKIN -->

        <div
            class="category-card"
            onclick="filterCategory('Skin Treatment')">

            
                <img src="images/skin-treatment.jpg" alt="Skin Treatment">

            <div class="category-overlay">

                <h3>
                    &#10024; Skin Treatment
                </h3>

            </div>

        </div>


        <!-- PAIN -->

        <div
            class="category-card"
            onclick="filterCategory('Pain Relief')">

            <img
                src="images/pain-relief.jpg"
                alt="Pain Relief"
            >

            <div class="category-overlay">

                <h3>
                    &#128138; Pain Relief
                </h3>

            </div>

        </div>


        <!-- VITAMINS -->

        <div
            class="category-card"
            onclick="filterCategory('Vitamins & Supplements')">

            <img
                src="images/vitamins.jpg"
                alt="Vitamins"
            >

            <div class="category-overlay">

                <h3>
                    &#127807; Vitamins &amp; Supplements
                </h3>

            </div>

        </div>


        <!-- COLD -->

        <div
            class="category-card"
            onclick="filterCategory('Cold & Allergy')">

            <img
                src="images/cold-allergy.jpg"
                alt="Cold and Allergy"
            >

            <div class="category-overlay">

                <h3>
                    &#127788; Cold &amp; Allergy
                </h3>

            </div>

        </div>


    </div>

</section>


<!-- =====================================================
     OFFER BANNER
     ===================================================== -->

<div class="offer">

    <div>

        <h2>
            Your Health Deserves Better
        </h2>

        <p>
            Explore our collection of medicines and healthcare products.
        </p>

    </div>


    <button
        class="offer-button"
        onclick="scrollToMedicines()">

        Explore Medicines

    </button>

</div>


<!-- =====================================================
     PRODUCTS
     ===================================================== -->

<section class="products" id="medicines">


    <div class="section-heading">

        <div>

            <h2>
                Popular Medicines
            </h2>

            <p>
                Trusted medicines available at MediNest
            </p>

        </div>

    </div>


    <!-- SEARCH RESULT MESSAGE -->

    <div
        id="searchResult"
        class="search-result">

        <div class="search-result-icon">
            &#128269;
        </div>

        <h3>
            No medicines found
        </h3>

        <p>
            Try searching with another medicine name,
            category, or manufacturer.
        </p>

    </div>


<%

    List<Medicine> medicineList =
        (List<Medicine>) request.getAttribute("medicineList");


    if (medicineList != null && !medicineList.isEmpty()) {

%>


    <div
        class="medicine-container"
        id="medicineContainer">


<%

        for (Medicine m : medicineList) {

%>


        <!-- MEDICINE CARD -->

        <div
            class="medicine-card"
            data-category="<%= m.getCategory() %>"
            data-name="<%= m.getName() %>"
            data-manufacturer="<%= m.getManufacturer() %>"
        >


            <!-- WISHLIST ADDED -->

            <form action="WishlistServlet" method="post" class="wishlist-form">

                <input
                    type="hidden"
                    name="medicineId"
                    value="<%= m.getId() %>"
                >

                <input
                    type="hidden"
                    name="medicineName"
                    value="<%= m.getName() %>"
                >

                <input
                    type="hidden"
                    name="price"
                    value="<%= m.getPrice() %>"
                >

                <input
                    type="hidden"
                    name="image"
                    value="<%= m.getImage() %>"
                >

                <button
                    type="submit"
                    class="wishlist-btn"
                    title="Add to Wishlist"
                >
                    &#10084;
                </button>

            </form>


            <div class="badge">
                VERIFIED
            </div>


            <!-- MEDICINE IMAGE -->

            <div class="image-container">

                <img
                    src="images/<%= m.getImage() %>"
                    alt="<%= m.getName() %>"
                    class="medicine-image"
                >

            </div>


            <!-- MEDICINE NAME -->

            <h3>
                <%= m.getName() %>
            </h3>


            <!-- CATEGORY -->

            <p class="category-name">
                <%= m.getCategory() %>
            </p>


            <!-- DESCRIPTION -->

            <p class="description">
                <%= m.getDescription() %>
            </p>


            <!-- MANUFACTURER -->

            <p class="manufacturer">

                <strong>
                    Manufacturer:
                </strong>

                <%= m.getManufacturer() %>

            </p>


            <!-- PRICE + STOCK -->

            <div class="price-row">

                <div class="price">

                    &#8377;<%= m.getPrice() %>

                </div>


                <% if (m.getStock() > 0) { %>

                    <div class="stock">

                        &#10003; <%= m.getStock() %> available

                    </div>

                <% } else { %>

                    <div class="stock out-of-stock">

                        &#10006; OUT OF STOCK

                    </div>

                <% } %>


            </div>


            <!-- BUTTONS -->

            <div class="button-container">


                <% if (m.getStock() > 0) { %>


                    <button
                        class="cart-btn"
                        onclick="addToCart(<%= m.getId() %>)">

                        &#128722; Add to Cart

                    </button>


                    <button
                        class="buy-btn"
                        onclick="buyNow(<%= m.getId() %>)">

                        Buy Now

                    </button>


                <% } else { %>


                    <button
                        class="cart-btn disabled-btn"
                        disabled>

                        &#128722; Out of Stock

                    </button>


                    <button
                        class="buy-btn disabled-btn"
                        disabled>

                        Out of Stock

                    </button>


                <% } %>


            </div>


        </div>


<%

        }

%>


    </div>


<%

    } else {

%>


    <h3 style="text-align:center;padding:50px;">

        No medicines found.

    </h3>


<%

    }

%>


</section>


<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer class="footer">


    <div class="footer-grid">


        <!-- ABOUT -->

        <div>

            <h2>
                Medi<span>Nest</span>
            </h2>

            <p>
                Your trusted online pharmacy for medicines
                and healthcare products. Convenient healthcare,
                right at your fingertips.
            </p>

        </div>


        <!-- QUICK LINKS -->

        <div>

            <h3>
                Quick Links
            </h3>

            <ul>

                <li>Home</li>
                <li>Medicines</li>
                <li>Categories</li>
                <li>My Orders</li>

            </ul>

        </div>


        <!-- CATEGORIES -->

        <div>

            <h3>
                Categories
            </h3>

            <ul>

                <li>Skin Treatment</li>
                <li>Pain Relief</li>
                <li>Vitamins</li>
                <li>Cold &amp; Allergy</li>

            </ul>

        </div>


        <!-- CUSTOMER CARE -->

        <div>

            <h3>
                Customer Care
            </h3>

            <ul>

                <li>Help Center</li>
                <li>Contact Us</li>
                <li>Order Tracking</li>
                <li>Privacy Policy</li>

            </ul>

        </div>


    </div>


    <div class="footer-bottom">

        &copy; 2026 MediNest. All Rights Reserved.

    </div>


</footer>


<!-- =====================================================
     JAVASCRIPT
     ===================================================== -->

<script>


/* =====================================================
   SEARCH MEDICINES
   ===================================================== */

function searchMedicine(shouldScroll = false) {

    let input =
        document
            .getElementById("searchInput")
            .value
            .toLowerCase()
            .trim();


    let cards =
        document.getElementsByClassName("medicine-card");


    let found = 0;


    for (let i = 0; i < cards.length; i++) {


        let name =
            cards[i]
                .getAttribute("data-name")
                .toLowerCase();


        let category =
            cards[i]
                .getAttribute("data-category")
                .toLowerCase();


        let manufacturer =
            cards[i]
                .getAttribute("data-manufacturer")
                .toLowerCase();


        /*
         * Search in:
         * 1. Medicine name
         * 2. Category
         * 3. Manufacturer
         */

        if (
            name.includes(input) ||
            category.includes(input) ||
            manufacturer.includes(input)
        ) {

            cards[i].style.display = "";

            found++;

        } else {

            cards[i].style.display = "none";

        }

    }


    /* =================================================
       SEARCH RESULT MESSAGE
       ================================================= */

    let result =
        document.getElementById("searchResult");


    let clearButton =
        document.getElementById("clearSearch");


    if (input !== "") {

        clearButton.style.display = "inline-block";

    } else {

        clearButton.style.display = "none";

    }


    if (input !== "" && found === 0) {

        result.style.display = "block";

    } else {

        result.style.display = "none";

    }


    /*
     * VERY IMPORTANT:
     *
     * Page scrolls ONLY when shouldScroll = true.
     *
     * Typing calls:
     * searchMedicine(false)
     *
     * Search button calls:
     * searchMedicine(true)
     */

    if (shouldScroll) {

        document
            .getElementById("medicines")
            .scrollIntoView({
                behavior: "smooth"
            });

    }

}


/* =====================================================
   CLEAR SEARCH
   ===================================================== */

function clearSearch() {


    document
        .getElementById("searchInput")
        .value = "";


    /*
     * Search again with empty text.
     * This shows all medicines.
     */

    searchMedicine(false);


    /*
     * Then scroll to medicines.
     */

    document
        .getElementById("medicines")
        .scrollIntoView({
            behavior: "smooth"
        });

}


/* =====================================================
   CATEGORY FILTER
   ===================================================== */

function filterCategory(category) {


    let cards =
        document.getElementsByClassName("medicine-card");


    let found = 0;


    for (let i = 0; i < cards.length; i++) {


        let cardCategory =
            cards[i]
                .getAttribute("data-category");


        if (cardCategory === category) {

            cards[i].style.display = "";

            found++;

        } else {

            cards[i].style.display = "none";

        }

    }


    /*
     * Put selected category
     * inside search box.
     */

    document
        .getElementById("searchInput")
        .value = category;


    /*
     * Show clear button.
     */

    document
        .getElementById("clearSearch")
        .style.display = "inline-block";


    /*
     * Show "No medicines found"
     * if category has no medicine.
     */

    document
        .getElementById("searchResult")
        .style.display =
            found === 0 ? "block" : "none";


    /*
     * Category click SHOULD scroll.
     */

    document
        .getElementById("medicines")
        .scrollIntoView({
            behavior: "smooth"
        });

}


/* =====================================================
   EXPLORE MEDICINES
   ===================================================== */

function scrollToMedicines() {


    document
        .getElementById("medicines")
        .scrollIntoView({
            behavior: "smooth"
        });

}


/* =====================================================
   CART
   ===================================================== */

function addToCart(id) {

    window.location.href =
        "addToCart?id=" + id;

}


/* =====================================================
   BUY NOW
   ===================================================== */

function buyNow(id) {

    window.location.href =
        "buyNow?id=" + id;

}


</script>


</body>

</html>

