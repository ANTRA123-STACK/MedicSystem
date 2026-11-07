package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestConnection {

    public static void main(String[] args) {

        try {

            Connection con = DBConnection.getConnection();

            System.out.println("Database connected successfully!");
            System.out.println("Database name: " + con.getCatalog());

            String sql = "SELECT COUNT(*) FROM public.medicines";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                System.out.println(
                    "Number of medicines: " + rs.getInt(1)
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println("Database connection failed!");
            e.printStackTrace();
        }
    }
}