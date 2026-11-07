package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Medicine;

public class MedicineDAO {

    public List<Medicine> getAllMedicines() {

        List<Medicine> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT medicine_id, medicine_name, category, "
                  + "description, price, stock, manufacturer, image "
                  + "FROM public.medicines";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Medicine m = new Medicine();

                m.setId(rs.getInt("medicine_id"));
                m.setName(rs.getString("medicine_name"));
                m.setCategory(rs.getString("category"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setStock(rs.getInt("stock"));
                m.setManufacturer(rs.getString("manufacturer"));
                m.setImage(rs.getString("image"));

                list.add(m);
            }

            rs.close();
            ps.close();
            con.close();

            return list;

        } catch (Exception e) {

            // DON'T hide the error
            throw new RuntimeException(
                    "ERROR INSIDE MedicineDAO: " + e.getMessage(),
                    e
            );
        }
    }
}