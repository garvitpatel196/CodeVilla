
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/HTML");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?zeroDateTimeBehavior=convertToNull", "root", "");
            Statement SS = C1.createStatement();
            String sql = "SELECT * FROM login WHERE User_Name='" + user + "' and Password='" + pass + "'";
            ResultSet rs = SS.executeQuery(sql);
            if (rs.next() == true) {
                HttpSession session = request.getSession(true);
                
                
                session.setAttribute("fname", rs.getString("First_Name"));
                session.setAttribute("lname", rs.getString("Last_Name"));
                session.setAttribute("user", rs.getString("User_Name"));
                session.setAttribute("pass", rs.getString("Password"));
                session.setAttribute("phno", rs.getString("Phone_Number"));
                session.setAttribute("add", rs.getString("Address"));
                session.setAttribute("id", "0");
                out.println("0");
            } else {
                out.println("1");
            }
        } catch (ClassNotFoundException | SQLException e) {

        }

    }
}