package Medicineservlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MedicineDAO;
import model.Medicine;

@WebServlet("/MedicineServlet")
public class MedicineServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        MedicineDAO dao = new MedicineDAO();

        List<Medicine> medicineList =
                dao.getAllMedicines();

        request.setAttribute(
                "medicineList",
                medicineList
        );

        request.getRequestDispatcher(
                "medicine.jsp"
        ).forward(request, response);
    }
}