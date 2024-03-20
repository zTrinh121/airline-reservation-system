/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PaymentDetails;
import model.PaymentServices;

/**
 *
 * @author Trinh
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet PaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        try {
//            ReviewPaymentServlet(request, response);
//        } catch (Exception ex) {
//            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command == null) {
            response.sendRedirect("error.jsp");
        } else {
            switch (command) {
                case "authorize": {
                    try {
                        AuthorizePaymentServlet(request, response);
                    } catch (Exception ex) {
                        Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
//                case "execute": {
//                    try {
//                        ExecutePaymentServlet(request, response);
//                    } catch (Exception ex) {
//                        Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//                }
//                case "review":
//                    try {
//                        ReviewPaymentServlet(request, response);
//                } catch (Exception e) {
//                }
//                break;
                default:
                    throw new AssertionError();
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void AuthorizePaymentServlet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String total = request.getParameter("total");
        java.util.Date today = new java.util.Date();
        java.sql.Date sqlToday = new java.sql.Date(today.getTime());
        double sum = Double.parseDouble(total);
        PaymentDetails paymentDetails = new PaymentDetails("PAY001", "PNR001", sqlToday, sum, "paypal");
        System.out.println(paymentDetails);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(paymentDetails);
            response.sendRedirect(approvalLink);
        } catch (PayPalRESTException ex) {
            request.setAttribute("error", "Invalid Payment Details");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

//    private void ExecutePaymentServlet(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String paymentId = request.getParameter("paymentId");
//        String payerId = request.getParameter("PayerID");
//
//        try {
//            PaymentServices paymentServices = new PaymentServices();
//            Payment payment = paymentServices.executePayment(paymentId, payerId);
//
//            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
//            Transaction transaction = payment.getTransactions().get(0);
//
//            request.setAttribute("payer", payerInfo);
//            request.setAttribute("transaction", transaction);
//
//            request.getRequestDispatcher("receipt.jsp").forward(request, response);
//
//        } catch (PayPalRESTException ex) {
//            request.setAttribute("error", "Could not execute payment");
//            request.getRequestDispatcher("error.jsp").forward(request, response);
//        }
//    }
//    private void ReviewPaymentServlet(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String paymentId = request.getParameter("paymentId");
//        String payerId = request.getParameter("PayerID");
//
//        try {
//            PaymentServices paymentservices = new PaymentServices();
//            Payment payment = paymentservices.getPaymentDetails(paymentId);
//
//            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
//            Transaction transaction = payment.getTransactions().get(0);
//            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
//
//            request.setAttribute("payer", payerInfo);
//            request.setAttribute("transaction", transaction);
//            request.setAttribute("shippingAddress", shippingAddress);
//
//            String url = "review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
//            request.getRequestDispatcher(url).forward(request, response);
//        } catch (PayPalRESTException ex) {
//            request.setAttribute("error", "Could not get payment details");
//            request.getRequestDispatcher("error.jsp").forward(request, response);
//        }
//    }
}
