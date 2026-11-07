package servlet;

import dao.DBConnection;
import model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {


@Override
protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    try {

        // Get medicine ID from URL
        int id = Integer.parseInt(
                request.getParameter("id")
        );

        // Get database connection
        Connection con = DBConnection.getConnection();

        String sql =
                "SELECT medicine_id, medicine_name, price, image, stock " +
                "FROM public.medicines " +
                "WHERE medicine_id = ?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs =
                ps.executeQuery();


        if (rs.next()) {

            int medicineId =
                    rs.getInt("medicine_id");

            String name =
                    rs.getString("medicine_name");

            double price =
                    rs.getDouble("price");

            String image =
                    rs.getString("image");

            int stock =
                    rs.getInt("stock");


            // =========================================
            // CHECK IF MEDICINE IS OUT OF STOCK
            // =========================================

            if (stock <= 0) {

                rs.close();
                ps.close();
                con.close();

                response.setContentType(
                        "text/html;charset=UTF-8"
                );

                response.getWriter().println(
                        "<script>" +
                        "alert('Sorry! " + name +
                        " is currently out of stock.');" +
                        "window.location.href='medicine';" +
                        "</script>"
                );

                return;
            }


            // Get session
            HttpSession session =
                    request.getSession();


            // Get existing cart
            List<CartItem> cart =
                    (List<CartItem>)
                    session.getAttribute("cart");


            // If cart doesn't exist
            if (cart == null) {

                cart = new ArrayList<>();

            }


            // Check if medicine already exists
            boolean found = false;


            for (CartItem item : cart) {

                if (item.getId() == medicineId) {

                    // Check stock before increasing quantity
                    if (item.getQuantity() < stock) {

                        item.setQuantity(
                                item.getQuantity() + 1
                        );

                    } else {

                        rs.close();
                        ps.close();
                        con.close();

                        response.setContentType(
                                "text/html;charset=UTF-8"
                        );

                        response.getWriter().println(
                                "<script>" +
                                "alert('Sorry! Only " +
                                stock +
                                " units are available.');" +
                                "window.location.href='cart.jsp';" +
                                "</script>"
                        );

                        return;
                    }

                    found = true;

                    break;
                }
            }


            // If medicine is not already in cart
            if (!found) {

                CartItem item =
                        new CartItem(
                                medicineId,
                                name,
                                price,
                                image,
                                1
                        );

                cart.add(item);
            }


            // Save cart in session
            session.setAttribute(
                    "cart",
                    cart
            );


            rs.close();
            ps.close();
            con.close();


            // Go to cart
            response.sendRedirect(
                    "cart.jsp"
            );

        } else {

            rs.close();
            ps.close();
            con.close();

            response.sendRedirect(
                    "medicine"
            );
        }


    } catch (Exception e) {

        throw new ServletException(
                "Error while adding medicine to cart: "
                + e.getMessage(),
                e
        );
    }
}


}
