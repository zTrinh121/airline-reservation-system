package controller;

import dao.AccountDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;

public class ProfileServlet_a extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    String action = request.getParameter("action");

    if ("saveProfile".equals(action)) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Admin adminAccount = (Admin) session.getAttribute("admin");
            if (adminAccount != null) {
                String adminId = request.getParameter("adminId");
                String name = request.getParameter("username");
                String email = request.getParameter("email");

                adminAccount.setAdminId(adminId);
                adminAccount.setName(name);
                adminAccount.setEmail(email);

                AccountDao accountDao = new AccountDao();
                boolean updated = accountDao.updateAdmin(adminAccount);
                if (updated) {
                    session.setAttribute("admin", adminAccount); 
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("a_profile.jsp");
                }
            }
        }
    } else if ("savePass".equals(action)) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Admin adminAccount = (Admin) session.getAttribute("admin");
            if (adminAccount != null) {
                String currentPassword = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");

                String adminId = adminAccount.getAdminId();
                AccountDao accountDao = new AccountDao(); 
                String oldPassword = accountDao.getPasswordByAdminId(adminId);

                if (oldPassword != null && oldPassword.equals(currentPassword)) {
                    boolean passwordUpdated = accountDao.updatePasswordAdmin(adminId, newPassword);
                    if (passwordUpdated) {
                        adminAccount.setPassword(newPassword);
                        session.setAttribute("admin", adminAccount);
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("password_a.jsp");
                    }
                } else {
                    response.sendRedirect("password_a.jsp?action=invalidPassword");
                }
            }
        }
    }
}

}
