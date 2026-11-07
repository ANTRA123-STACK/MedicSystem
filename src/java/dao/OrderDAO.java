package dao;

import model.Order;
import model.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDAO {

    // ==========================================
    // SAVE MAIN ORDER
    // ==========================================
    public int createOrder(Order order) throws SQLException {

        String sql = "INSERT INTO orders " +
                     "(customer_name, mobile, address, city, pincode, " +
                     "payment_method, total_amount) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?) " +
                     "RETURNING order_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, order.getCustomerName());
            ps.setString(2, order.getMobile());
            ps.setString(3, order.getAddress());
            ps.setString(4, order.getCity());
            ps.setString(5, order.getPincode());
            ps.setString(6, order.getPaymentMethod());
            ps.setDouble(7, order.getTotalAmount());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("order_id");
            }
        }

        return -1;
    }


    // ==========================================
    // SAVE EACH MEDICINE INSIDE THE ORDER
    // ==========================================
    public void addOrderItem(OrderItem item) throws SQLException {

        String sql = "INSERT INTO order_items " +
                     "(order_id, medicine_id, medicine_name, quantity, " +
                     "price, item_total) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getMedicineId());
            ps.setString(3, item.getMedicineName());
            ps.setInt(4, item.getQuantity());
            ps.setDouble(5, item.getPrice());
            ps.setDouble(6, item.getItemTotal());

            ps.executeUpdate();
        }
    }


    // ==========================================
    // REDUCE MEDICINE STOCK AFTER PURCHASE
    // ==========================================
    public boolean reduceStock(int medicineId, int quantity) {

        String sql =
                "UPDATE public.medicines " +
                "SET stock = stock - ? " +
                "WHERE medicine_id = ? " +
                "AND stock >= ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quantity);
            ps.setInt(2, medicineId);
            ps.setInt(3, quantity);

            int rowsUpdated = ps.executeUpdate();

            return rowsUpdated == 1;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }

}