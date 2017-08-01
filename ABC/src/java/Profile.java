import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author garavit
 */
public class Profile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/HTML");
            PrintWriter out = response.getWriter();
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            String phno = request.getParameter("phno");
            String add = request.getParameter("add");
            HttpSession session = request.getSession(true);
            String username = (String) session.getAttribute("user");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?zeroDateTimeBehavior=convertToNull", "root", "");
            String quer = "UPDATE login " + "SET First_Name ='" + fname 
                    + "',Last_Name='" + lname 
                    + "',User_Name='" + user 
                    + "',Password='" + pass 
                    + "',Phone_Number='" + phno 
                    + "',Address='" + add 
                    + "'" + "WHERE User_Name='" + username + "';";
            Statement SS = C1.createStatement();
            SS.executeUpdate(quer);
            session.setAttribute("fname", fname);
            session.setAttribute("lname", lname);
            session.setAttribute("user",user);
            session.setAttribute("pass",pass);
            session.setAttribute("phno", phno);
            session.setAttribute("add",add);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
