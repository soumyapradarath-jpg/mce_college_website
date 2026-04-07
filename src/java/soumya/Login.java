package soumya;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import jakarta.servlet.http.*;
import java.io.PrintWriter;
import java.net.URLEncoder;
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;
    

    // Database details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/student_data";
    private static final String JDBC_USER = "root";  // your MySQL username
    private static final String JDBC_PASS = "123456"; // your MySQL password

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        // Get user input from form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String roll = request.getParameter("roll");

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to DB
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            // Query
            String sql = "SELECT * FROM students WHERE username=? AND password=? AND email=? AND roll=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4,roll);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Valid login → create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("roll", roll);
                
                String successMessage = "Logged in successfully!";
                String encodedMessage = URLEncoder.encode(successMessage, "UTF-8");
      
                // Redirect to dashboard
                response.sendRedirect("student_portal.jsp?message=" + encodedMessage);
            } else {
                // Invalid credentials → back to login
                String ErrorMessage = "Wrong credential";
                String encodedMessage = URLEncoder.encode(ErrorMessage, "UTF-8");
      
                // Redirect to dashboard
                response.sendRedirect("login.jsp?error=" + encodedMessage);
//                out.println(username);
//                out.println(password);
//                out.println(email);
//                out.println(roll);
            }

            // Cleanup
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    
    
}