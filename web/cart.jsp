```jsp
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>My Cart - MediNest</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f9fa;
            color: #263238;
        }

        /* ================= HEADER ================= */

        .header {
            background: white;
            height: 75px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;

            box-shadow: 0 2px 10px rgba(0,0,0,.08);
        }

        .logo {
            font-size: 30px;
            font-weight: bold;
            color: #087f79;
        }

        .logo span {
            color: #ff8c00;
        }

        .back-btn {
            text-decoration: none;
            color: #087f79;
            font-weight: bold;
        }

        .back-btn:hover {
            color: #056963;
        }

        /* ================= MAIN ================= */

        .container {
            width: 86%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .title {
            font-size: 30px;
            margin-bottom: 25px;
        }

        /* ================= CART ================= */

        .cart-layout {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 25px;
        }

        .cart-box {
            background: white;
            border-radius: 12px;
            padding: 20px;

            box-shadow: 0 3px 15px rgba(0,0,0,.07);
        }

        /* ================= ITEM ================= */

        .cart-item {
            display: flex;
            align-items: center;
            gap: 20px;

            padding: 20px 0;

            border-bottom: 1px solid #eee;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-image {
            width: 100px;
            height: 100px;

            background: #f7fafb;

            border-radius: 10px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;
        }

        .item-image img {
            width: 85px;
            height: 85px;

            object-fit: contain;
        }

        .item-details {
            flex: 1;
        }

        .item-details h3 {
            margin-bottom: 8px;
            font-size: 18px;
        }

        .item-price {
            color: #087f79;

            font-weight: bold;

            font-size: 18px;

            margin-top: 7px;
        }

        /* ================= QUANTITY ================= */

        .quantity-section {
            margin-top: 12px;

            display: flex;
            align-items: center;

            gap: 10px;
        }

        .quantity-label {
            color: #666;
            font-size: 14px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;

            border: 1px solid #ddd;

            border-radius: 6px;

            overflow: hidden;
        }

        .quantity-btn {
            width: 38px;
            height: 34px;

            border: none;

            background: #f4f7f7;

            color: #087f79;

            font-size: 18px;

            font-weight: bold;

            cursor: pointer;
        }

        .quantity-btn:hover {
            background: #e3f3f1;
        }

        .quantity-number {
            width: 40px;
            height: 34px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-weight: bold;

            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
        }

        /* ================= REMOVE ================= */

        .remove-btn {
            margin-top: 10px;

            background: none;

            border: none;

            color: #e53935;

            font-size: 14px;

            cursor: pointer;

            font-weight: bold;
        }

        .remove-btn:hover {
            color: #b71c1c;
            text-decoration: underline;
        }

        .item-total {
            font-size: 18px;

            font-weight: bold;

            min-width: 90px;

            text-align: right;
        }

        /* ================= SUMMARY ================= */

        .summary {
            background: white;

            border-radius: 12px;

            padding: 25px;

            height: fit-content;

            box-shadow: 0 3px 15px rgba(0,0,0,.07);
        }

        .summary h2 {
            margin-bottom: 20px;
        }

        .summary-row {
            display: flex;

            justify-content: space-between;

            padding: 10px 0;

            color: #555;
        }

        .summary-total {
            display: flex;

            justify-content: space-between;

            border-top: 1px solid #ddd;

            padding-top: 18px;

            margin-top: 10px;

            font-size: 21px;

            font-weight: bold;

            color: #087f79;
        }

        .checkout-btn {
            width: 100%;

            margin-top: 20px;

            padding: 14px;

            background: #087f79;

            color: white;

            border: none;

            border-radius: 8px;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;
        }

        .checkout-btn:hover {
            background: #056963;
        }

        /* ================= TRUST ================= */

        .trust {
            margin-top: 18px;

            padding: 12px;

            background: #f0f9f7;

            border-radius: 8px;

            text-align: center;

            color: #087f79;

            font-size: 14px;

            font-weight: bold;
        }

        /* ================= EMPTY CART ================= */

        .empty {
            text-align: center;

            padding: 80px 20px;
        }

        .empty-icon {
            font-size: 60px;

            margin-bottom: 20px;
        }

        .empty h2 {
            margin-bottom: 10px;
        }

        .empty p {
            color: #777;

            margin-bottom: 25px;
        }

        .shop-btn {
            display: inline-block;

            background: #087f79;

            color: white;

            text-decoration: none;

            padding: 13px 25px;

            border-radius: 7px;
        }

        .shop-btn:hover {
            background: #056963;
        }

        /* ================= MOBILE ================= */

        @media(max-width: 750px) {

            .cart-layout {
                grid-template-columns: 1fr;
            }

            .header {
                padding: 0 20px;
            }

            .container {
                width: 92%;
            }

            .cart-item {
                flex-wrap: wrap;
            }

            .item-total {
                width: 100%;
                text-align: left;
            }

        }

    </style>

</head>


<body>


<!-- ================= HEADER ================= -->

<header class="header">

    <div class="logo">

        Medi<span>Nest</span>

    </div>


    <a
        href="medicine"
        class="back-btn">

        &larr; Continue Shopping

    </a>

</header>


<!-- ================= MAIN ================= -->

<div class="container">


    <h1 class="title">

        &#128722; My Cart

    </h1>


    <%

        List<CartItem> cart =
                (List<CartItem>)
                session.getAttribute("cart");


        if (cart != null && !cart.isEmpty()) {

            double subtotal = 0;


            for (CartItem item : cart) {

                subtotal += item.getTotal();

            }

    %>


    <div class="cart-layout">


        <!-- ================= CART ITEMS ================= -->

        <div class="cart-box">


            <%

                for (CartItem item : cart) {

            %>


            <div class="cart-item">


                <!-- MEDICINE IMAGE -->

                <div class="item-image">

                    <img
                        src="images/<%= item.getImage() %>"
                        alt="<%= item.getName() %>"
                    >

                </div>


                <!-- MEDICINE DETAILS -->

                <div class="item-details">


                    <h3>

                        <%= item.getName() %>

                    </h3>


                    <div class="item-price">

                        &#8377;<%= String.format("%.2f", item.getPrice()) %>

                    </div>


                    <!-- QUANTITY -->

                    <div class="quantity-section">


                        <span class="quantity-label">

                            Quantity:

                        </span>


                        <div class="quantity-controls">


                            <!-- DECREASE -->

                            <a
                                href="updateCart?id=<%= item.getId() %>&action=decrease"
                                style="text-decoration:none;">

                                <button
                                    type="button"
                                    class="quantity-btn">

                                    &#10134;

                                </button>

                            </a>


                            <!-- CURRENT QUANTITY -->

                            <div class="quantity-number">

                                <%= item.getQuantity() %>

                            </div>


                            <!-- INCREASE -->

                            <a
                                href="updateCart?id=<%= item.getId() %>&action=increase"
                                style="text-decoration:none;">

                                <button
                                    type="button"
                                    class="quantity-btn">

                                    &#10133;

                                </button>

                            </a>


                        </div>

                    </div>


                    <!-- REMOVE -->

                    <a
                        href="updateCart?id=<%= item.getId() %>&action=remove"
                        onclick="return confirm('Remove this medicine from your cart?');"
                        style="text-decoration:none;">

                        <button
                            type="button"
                            class="remove-btn">

                            &#128465;&#65039; Remove

                        </button>

                    </a>


                </div>


                <!-- ITEM TOTAL -->

                <div class="item-total">

                    &#8377;<%= String.format("%.2f", item.getTotal()) %>

                </div>


            </div>


            <%

                }

            %>


        </div>


        <!-- ================= SUMMARY ================= -->

        <div class="summary">


            <h2>

                Order Summary

            </h2>


            <div class="summary-row">

                <span>

                    Subtotal

                </span>

                <span>

                    &#8377;<%= String.format("%.2f", subtotal) %>

                </span>

            </div>


            <div class="summary-row">

                <span>

                    &#128666; Delivery

                </span>

                <span>

                    FREE

                </span>

            </div>


            <div class="summary-total">

                <span>

                    Total

                </span>

                <span>

                    &#8377;<%= String.format("%.2f", subtotal) %>

                </span>

            </div>


            <button
                class="checkout-btn"
                onclick="checkout()">

                &#128179; Proceed to Checkout &rarr;

            </button>


            <div class="trust">

                &#128737;&#65039; Trusted &amp; Secure Pharmacy

            </div>


        </div>


    </div>


    <%

        } else {

    %>


    <!-- ================= EMPTY CART ================= -->

    <div class="cart-box empty">


        <div class="empty-icon">

            &#128722;

        </div>


        <h2>

            Your cart is empty

        </h2>


        <p>

            Looks like you haven't added anything yet.

        </p>


        <a
            href="medicine"
            class="shop-btn">

            &#128138; Browse Medicines

        </a>


    </div>


    <%

        }

    %>


</div>


<script>

    function checkout() {
        

        window.location.href = "checkout.jsp";

    }

    

</script>


</body>

</html>
```
