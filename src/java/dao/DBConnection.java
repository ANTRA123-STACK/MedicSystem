package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:postgresql://localhost:5432/medicsystem";

    private static final String USER = "postgres";

    private static final String PASSWORD = "manager";

    public static Connection getConnection() throws SQLException {

        try {

            // Explicitly load PostgreSQL JDBC Driver
            Class.forName("org.postgresql.Driver");

        } catch (ClassNotFoundException e) {

            throw new SQLException(
                    "PostgreSQL JDBC Driver NOT FOUND!",
                    e
            );
        }

        return DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
        );
    }
}