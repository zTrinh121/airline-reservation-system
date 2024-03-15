package filter;

import dao.AccountDao;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

public class LoginFilter implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;

    public LoginFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LoginFilter: DoBeforeProcessing");
        }
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LoginFilter: DoAfterProcessing");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("LoginFilter: doFilter()");
        } 
        
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
         if (!req.getRequestURI().endsWith("login.jsp")) {
            // Thiết lập các headers để ngăn chặn lưu trữ vào bộ nhớ cache
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            res.setHeader("Pragma", "no-cache");
            res.setHeader("Expires", "0");
        }
         String requestURI = req.getRequestURI();
          
        HttpSession session = req.getSession(false);
          
     
       
        String password = (String) session.getAttribute("password");
         String username = (String) session.getAttribute("username");
        AccountDao accountDao = new AccountDao();
        String userRole = accountDao.getUserRole(username, password);

        boolean isLoggedIn = session != null && session.getAttribute("username") != null;

     

        if (isLoggedIn ) {
            System.out.println(userRole);
            if ("admin".equals(userRole)) {
                List<String> adminPages = Arrays.asList("profile_a.jsp","password_a.jsp","admin.jsp", "addFlight.jsp", "addFlightPassenger.jsp", "addTicketAdmin.jsp", "flight.jsp", "listFlightAdmin.jsp", "listFlightSearchAdmin.jsp", "listTicket.jsp", "searchFlight.jsp", "searchResult.jsp", "updateFlight.jsp", "updateTicket.jsp");

                if (adminPages.stream().anyMatch(req.getRequestURI()::contains)) {
                    chain.doFilter(request, response);

                }else{
                    res.sendRedirect("admin.jsp");
                    
                }
            } else if ("user".equals(userRole)) {
                System.out.println("hihih");
                List<String> userPages = Arrays.asList("user.jsp", "offers", "contact.jsp","profile.jsp","password.jsp");

                if (userPages.stream().anyMatch(req.getRequestURI()::contains)) {

                    chain.doFilter(request, response);

                }else{
                    res.sendRedirect("user.jsp");
                }

            }

        } else {

            res.sendRedirect("login.jsp");
        }
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("LoginFilter: Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("LoginFilter()");
        }
        StringBuffer sb = new StringBuffer("LoginFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n");
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>");
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
