<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String orderId = request.getParameter("orderId");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Order Successful - MediNest</title>

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

            display: flex;
            align-items: center;
            justify-content: center;

            min-height: 100vh;
        }

        .success-box {
            background: white;

            width: 90%;
            max-width: 550px;

            text-align: center;

            padding: 50px 35px;

            border-radius: 15px;

            box-shadow: 0 5px 25px rgba(0,0,0,.10);
        }

        .success-icon {
            font-size: 70px;
            margin-bottom: 20px;
        }

        h1 {
            color: #087f79;
            margin-bottom: 15px;
        }

        .message {
            color: #666;
            font-size: 16px;
            line-height: 1.6;
        }

        .order-id {
            display: inline-block;

            margin: 25px 0;

            padding: 12px 25px;

            background: #f0f9f7;

            border-radius: 8px;

            color: #087f79;

            font-size: 20px;

            font-weight: bold;
        }

        .shop-btn {
            display: inline-block;

            background: #087f79;

            color: white;

            text-decoration: none;

            padding: 14px 28px;

            border-radius: 8px;

            font-weight: bold;
        }

        .shop-btn:hover {
            background: #056963;
        }

        .footer-text {
            margin-top: 20px;

            color: #999;

            font-size: 13px;
        }

    </style>

</head>


<body>


<div class="success-box">

    <div class="success-icon">
        &#9989;
    </div>

    <h1>
        Order Placed Successfully!
    </h1>

    <p class="message">

        Thank you for shopping with
        <strong>MediNest</strong>!

        <br>

        Your order has been received successfully.

    </p>


    <div class="order-id">

        Order ID: #<%= orderId %>

    </div>


    <br>


    <a href="medicine" class="shop-btn">

        &#128138; Continue Shopping

    </a>


    <p class="footer-text">

        &#128737;&#65039; Your order information has been securely saved.

    </p>

</div>


</body>

</html>