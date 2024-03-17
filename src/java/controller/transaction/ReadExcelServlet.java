package controller.transaction;

import dao.DonationDAO;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

public class ReadExcelServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        String username = user.getUserName();
        System.out.println(username);
        String filePath = getServletContext().getRealPath("/WEB-INF/excel/Transaction.xlsx");
        String sheetName = "Sheet1"; // Thay thế bằng tên sheet thực tế
        int donationId = Integer.parseInt(request.getParameter("donationId"));
        String magd = request.getParameter("magd");
        System.out.println(magd);
        HandleFileExcel handleFileExcel = new HandleFileExcel();
        boolean check = handleFileExcel.readAndWriteToDatabase(filePath, sheetName, donationId,magd);
        if (check == false) {
            String alertMessage = "Your transaction have some problem. Please wait 1-2 minutes and submit again";
            request.setAttribute("alertMessage", alertMessage);
            request.getRequestDispatcher("vietinbanktransaction.jsp").forward(request, response);
            return;
        } else {
            try {
                DonationDAO dao = new DonationDAO();
                dao.updateDonatedAmount(donationId);
                request.getRequestDispatcher("thanks.jsp").forward(request, response); // Chuyển hướng sau khi hoàn thành
            } catch (SQLException ex) {
                Logger.getLogger(ReadExcelServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ReadExcelServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
