package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AccountDao;
import model.Account;

public class ProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Điều hướng trực tiếp đến phương thức doPost
            doPost(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("saveProfile".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Account userAccount = (Account) session.getAttribute("userAccount");
                if (userAccount != null) {
                    String fullName = request.getParameter("fullname");
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String phoneNumber = request.getParameter("phoneNumber");
                    String address = request.getParameter("address");

                    // Cập nhật thông tin profile
                    userAccount.setFullName(fullName);
                    userAccount.setUserName(username);
                    userAccount.setEmail(email);
                    userAccount.setPhoneNumber(phoneNumber);
                    userAccount.setAddress(address);
                    AccountDao accountDao = new AccountDao();
                    boolean updated = accountDao.updateAccount(userAccount);
                    if (updated) {
                        // Nếu cập nhật thành công, cập nhật thông tin vào session
                        session.setAttribute("userAccount", userAccount);
                        // Redirect hoặc forward đến trang profile
                        response.sendRedirect("user.jsp");
                    } else {
                        // Xử lý lỗi khi cập nhật không thành công
                        // Ví dụ: hiển thị thông báo lỗi và quay lại trang chỉnh sửa
                        response.sendRedirect("profile.jsp");
                    }
                }
            }
        } else if ("savePass".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Account userAccount = (Account) session.getAttribute("userAccount");
                AccountDao accountDao = new AccountDao();
                if (userAccount != null) {
                    String currentPassword = request.getParameter("currentPassword");
                    String newPassword = request.getParameter("newPassword");

                  
                    int accountId = userAccount.getAccountID();

                   
                    String oldPassword = accountDao.getPasswordById(accountId);

                   
                    if (oldPassword != null && oldPassword.equals(currentPassword)) {
                        boolean passwordUpdated = accountDao.updatePassword(accountId, newPassword);
                        if (passwordUpdated) {
                            
                            userAccount.setPassword(newPassword);
                            session.setAttribute("userAccount", userAccount);
                           
                            response.sendRedirect("user.jsp");
                        } else {
                            
                           
                            response.sendRedirect(request.getContextPath() + "/password.jsp?error=updateFailed");
                        }
                    } else {
                      
                        response.sendRedirect(request.getContextPath() + "/password.jsp?action=invalidPassword");

                    }
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
