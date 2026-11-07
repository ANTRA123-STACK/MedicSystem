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

@WebServlet("/buyNow")
public class BuyNowServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get medicine ID
            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            // Connect to database
            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT medicine_id, medicine_name, price, image, stock " +
                    "FROM public.medicines " +
                    "WHERE medicine_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

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


                // Check stock
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

                // Create a NEW cart containing only
                // the medicine selected with Buy Now
                List<CartItem> cart =
                        new ArrayList<>();

                CartItem item =
                        new CartItem(
                                medicineId,
                                name,
                                price,
                                image,
                                1
                        );

                cart.add(item);

                // Save cart in session
                session.setAttribute(
                        "cart",
                        cart
                );


                rs.close();
                ps.close();
                con.close();


                // Go directly to checkout
                response.sendRedirect(
                        "checkout.jsp"
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
                    "Error while buying medicine: "
                    + e.getMessage(),
                    e
            );
        }
    }
}