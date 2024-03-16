/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDao;
import dbcontext.ConnectDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import model.Account;
import model.Admin;

/**
 *
 * @author HP
 */
public class Login extends HttpServlet {
    
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    HttpSession session = request.getSession(false); // Lấy session nếu nó tồn tại

    if (session != null) {
        session.invalidate(); 
    }

    // Thêm tham số ngẫu nhiên vào URL để tránh việc lưu trữ bản sao của trang trong bộ nhớ cache của trình duyệt
    response.sendRedirect("login.jsp?rnd=" + Math.random());
}




    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");

    if ("login".equals(action)) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember_me");

        AccountDao accountDao = new AccountDao();

        if (accountDao.checkAccountExist(username, password)) {
            HttpSession session = request.getSession(); 
            int accountId = accountDao.getAccountIdByUsername(username); 
            session.setAttribute("username", username); 
            session.setAttribute("password", password);
            session.setAttribute("accountId", accountId);
            Account userAccount = accountDao.getUserDetails(accountId); // Lấy thông tin người dùng từ cơ sở dữ liệu
           
            session.setAttribute("userAccount", userAccount);

            if (accountDao.isAdmin(username, password)) {
                handleRememberMe(rememberMe, username, response);
                 Admin admin = accountDao.getAdminDetails(username);
                session.setAttribute("admin", admin);
                
                response.sendRedirect("admin.jsp");
            } else {
                handleRememberMe(rememberMe, username, response);
                response.sendRedirect("user.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    } else if ("register".equals(action)) {
        response.sendRedirect("register.jsp");
    }

}
     private void handleRememberMe(String rememberMe, String username, HttpServletResponse response) {
        if (rememberMe != null && rememberMe.equals("on")) {
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(30 * 24 * 60 * 60);
            response.addCookie(cookie);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
