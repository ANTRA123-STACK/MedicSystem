<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>

<%
    List<CartItem> cart =
        (List<CartItem>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    double subtotal = 0;

    for (CartItem item : cart) {
        subtotal += item.getTotal();
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Checkout - MediNest</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
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

        .back {
            text-decoration: none;
            color: #087f79;
            font-weight: bold;
        }

        .back:hover {
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

        .checkout-layout {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 25px;
        }

        /* ================= BOX ================= */

        .box {
            background: white;
            border-radius: 12px;
            padding: 25px;

            box-shadow: 0 3px 15px rgba(0,0,0,.07);

            margin-bottom: 20px;
        }

        .box h2 {
            margin-bottom: 20px;
            color: #263238;
        }

        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;

            font-weight: bold;
            font-size: 14px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;

            padding: 12px;

            border: 1px solid #ddd;

            border-radius: 7px;

            font-size: 14px;

            outline: none;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #087f79;
        }

        .form-group textarea {
            height: 90px;
            resize: vertical;
        }

        /* ================= PAYMENT ================= */

        .payment-option {
            display: block;

            border: 1px solid #ddd;

            border-radius: 8px;

            padding: 15px;

            margin-bottom: 10px;

            cursor: pointer;
        }

        .payment-option:hover {
            border-color: #087f79;
            background: #f5fbfa;
        }

        .payment-option input {
            margin-right: 8px;
        }

        /* ================= ORDER SUMMARY ================= */

        .summary-item {
            display: flex;

            justify-content: space-between;

            padding: 12px 0;

            border-bottom: 1px solid #eee;

            font-size: 14px;

            gap: 15px;
        }

        .summary-item:last-of-type {
            border-bottom: none;
        }

        .total {
            display: flex;

            justify-content: space-between;

            border-top: 1px solid #ddd;

            margin-top: 15px;

            padding-top: 18px;

            font-size: 21px;

            font-weight: bold;

            color: #087f79;
        }

        /* ================= PLACE ORDER ================= */

        .place-order {
            width: 100%;

            margin-top: 20px;

            padding: 15px;

            border: none;

            border-radius: 8px;

            background: #087f79;

            color: white;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;
        }

        .place-order:hover {
            background: #056963;
        }

        /* ================= SECURITY ================= */

        .secure {
            text-align: center;

            margin-top: 15px;

            padding: 12px;

            background: #f0f9f7;

            border-radius: 8px;

            color: #087f79;

            font-size: 13px;

            font-weight: bold;
        }

        /* ================= MOBILE ================= */

        @media(max-width: 750px) {

            .checkout-layout {
                grid-template-columns: 1fr;
            }

            .container {
                width: 92%;
            }

            .header {
                padding: 0 20px;
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

    <a href="cart.jsp" class="back">
        &larr; Back to Cart
    </a>

</header>


<!-- ================= MAIN ================= -->

<div class="container">

    <h1 class="title">
        &#128179; Checkout
    </h1>


    <!-- ================= CHECKOUT FORM ================= -->

    <form action="placeOrder" method="post">


        <div class="checkout-layout">


            <!-- ================= LEFT SIDE ================= -->

            <div>


                <!-- ================= DELIVERY ADDRESS ================= -->

                <div class="box">

                    <h2>
                        &#128205; Delivery Address
                    </h2>


                    <!-- FULL NAME -->

                    <div class="form-group">

                        <label>
                            Full Name
                        </label>

                        <input
                            type="text"
                            name="fullName"
                            placeholder="Enter your full name"
                            required
                        >

                    </div>


                    <!-- MOBILE -->

                    <div class="form-group">

                        <label>
                            Mobile Number
                        </label>

                        <input
                            type="tel"
                            name="mobile"
                            placeholder="Enter your mobile number"
                            required
                        >

                    </div>


                    <!-- ADDRESS -->

                    <div class="form-group">

                        <label>
                            Address
                        </label>

                        <textarea
                            name="address"
                            placeholder="House no., street, area"
                            required
                        ></textarea>

                    </div>


                    <!-- CITY -->

                    <div class="form-group">

                        <label>
                            City
                        </label>

                        <input
                            type="text"
                            name="city"
                            placeholder="Enter city"
                            required
                        >

                    </div>


                    <!-- PIN CODE -->

                    <div class="form-group">

                        <label>
                            PIN Code
                        </label>

                        <input
                            type="text"
                            name="pincode"
                            placeholder="Enter PIN code"
                            required
                        >

                    </div>


                </div>


                <!-- ================= PAYMENT METHOD ================= -->

                <div class="box">

                    <h2>
                        &#128179; Payment Method
                    </h2>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="payment"
                            value="cod"
                            checked
                            required
                        >

                        Cash on Delivery

                    </label>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="payment"
                            value="online"
                        >

                        Online Payment

                    </label>


                </div>


            </div>


            <!-- ================= RIGHT SIDE ================= -->

            <div class="box">


                <h2>
                    Order Summary
                </h2>


                <!-- CART ITEMS -->

                <%

                    for (CartItem item : cart) {

                %>


                <div class="summary-item">

                    <span>

                        <%= item.getName() %>

                        ×

                        <%= item.getQuantity() %>

                    </span>


                    <span>

                        &#8377;<%= String.format("%.2f",
                                item.getTotal()) %>

                    </span>

                </div>


                <%

                    }

                %>


                <!-- DELIVERY -->

                <div class="summary-item">

                    <span>
                        &#128666; Delivery
                    </span>

                    <span>
                        FREE
                    </span>

                </div>


                <!-- TOTAL -->

                <div class="total">

                    <span>
                        Total
                    </span>

                    <span>

                        &#8377;<%= String.format("%.2f",
                                subtotal) %>

                    </span>

                </div>


                <!-- PLACE ORDER BUTTON -->

                <button
                    type="submit"
                    class="place-order">

                    &#10003; Place Order

                </button>


                <!-- SECURITY -->

                <div class="secure">

                    &#128737;&#65039;

                    Safe &amp; Secure Checkout

                </div>


            </div>


        </div>


    </form>


</div>


</body>

</html>