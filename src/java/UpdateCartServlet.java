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
import java.util.List;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            String action =
                    request.getParameter("action");

            HttpSession session =
                    request.getSession();

            List<CartItem> cart =
                    (List<CartItem>)
                    session.getAttribute("cart");


            if (cart != null) {

                for (int i = 0; i < cart.size(); i++) {

                    CartItem item = cart.get(i);


                    if (item.getId() == id) {


                        // =========================================
                        // INCREASE QUANTITY
                        // =========================================

                        if ("increase".equals(action)) {

                            Connection con =
                                    DBConnection.getConnection();

                            String sql =
                                    "SELECT stock, medicine_name " +
                                    "FROM public.medicines " +
                                    "WHERE medicine_id = ?";

                            PreparedStatement ps =
                                    con.prepareStatement(sql);

                            ps.setInt(1, id);

                            ResultSet rs =
                                    ps.executeQuery();


                            if (rs.next()) {

                                int stock =
                                        rs.getInt("stock");

                                String medicineName =
                                        rs.getString("medicine_name");


                                // Check whether more stock is available
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
                                            "alert('Only " +
                                            stock +
                                            " units of " +
                                            medicineName +
                                            " are available.');" +
                                            "window.location.href='cart.jsp';" +
                                            "</script>"
                                    );

                                    return;
                                }
                            }


                            rs.close();
                            ps.close();
                            con.close();
                        }


                        // =========================================
                        // DECREASE QUANTITY
                        // =========================================

                        else if ("decrease".equals(action)) {

                            if (item.getQuantity() > 1) {

                                item.setQuantity(
                                        item.getQuantity() - 1
                                );

                            } else {

                                cart.remove(i);
                            }
                        }


                        // =========================================
                        // REMOVE ITEM
                        // =========================================

                        else if ("remove".equals(action)) {

                            cart.remove(i);
                        }


                        break;
                    }
                }


                // Save updated cart
                session.setAttribute(
                        "cart",
                        cart
                );
            }


            // Go back to cart
            response.sendRedirect(
                    "cart.jsp"
            );


        } catch (Exception e) {

            throw new ServletException(
                    "Error while updating cart: "
                    + e.getMessage(),
                    e
            );
        }
    }
}