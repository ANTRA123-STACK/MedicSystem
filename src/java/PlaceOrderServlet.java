package servlet;

import dao.OrderDAO;
import model.CartItem;
import model.Order;
import model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ==========================================
            // 1. GET CHECKOUT DETAILS
            // ==========================================

            String name = request.getParameter("fullName");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String pincode = request.getParameter("pincode");
            String payment = request.getParameter("payment");


            // ==========================================
            // 2. GET CART
            // ==========================================

            HttpSession session = request.getSession();

            List<CartItem> cart =
                    (List<CartItem>) session.getAttribute("cart");


            // ==========================================
            // 3. CHECK WHETHER CART IS EMPTY
            // ==========================================

            if (cart == null || cart.isEmpty()) {

                response.sendRedirect("cart.jsp");
                return;
            }


            // ==========================================
            // 4. CALCULATE TOTAL
            // ==========================================

            double total = 0;

            for (CartItem item : cart) {
                total += item.getTotal();
            }


            // ==========================================
            // 5. CREATE ORDER OBJECT
            // ==========================================

            Order order = new Order(
                    name,
                    mobile,
                    address,
                    city,
                    pincode,
                    payment,
                    total
            );


            // ==========================================
            // 6. CREATE DAO
            // ==========================================

            OrderDAO orderDAO = new OrderDAO();


            // ==========================================
            // 7. CHECK AND REDUCE STOCK
            // ==========================================

            for (CartItem item : cart) {

                boolean stockUpdated =
                        orderDAO.reduceStock(
                                item.getId(),
                                item.getQuantity()
                        );

                if (!stockUpdated) {

                    response.setContentType(
                            "text/html;charset=UTF-8"
                    );

                    response.getWriter().println(
                            "<script>" +
                            "alert('Sorry! Not enough stock available for " +
                            item.getName() + ". Please update your cart.');" +
                            "window.location.href='cart.jsp';" +
                            "</script>"
                    );

                    return;
                }
            }


            // ==========================================
            // 8. SAVE ORDER
            // ==========================================

            int orderId = orderDAO.createOrder(order);

            if (orderId == -1) {

                throw new ServletException(
                        "Order could not be created."
                );
            }


            // ==========================================
            // 9. SAVE EVERY ORDER ITEM
            // ==========================================

            for (CartItem item : cart) {

                OrderItem orderItem = new OrderItem(
                        orderId,
                        item.getId(),
                        item.getName(),
                        item.getQuantity(),
                        item.getPrice(),
                        item.getTotal()
                );

                orderDAO.addOrderItem(orderItem);
            }


            // ==========================================
            // 10. CLEAR CART
            // ==========================================

            session.removeAttribute("cart");


            // ==========================================
            // 11. GO TO SUCCESS PAGE
            // ==========================================

            response.sendRedirect(
                    "orderSuccess.jsp?orderId=" + orderId
            );


        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Error while placing order: "
                    + e.getMessage(),
                    e
            );
        }
    }
}