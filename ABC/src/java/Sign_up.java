
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.sql.DriverManager;

public class Sign_up extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/HTML");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // p1.println("Driver Loaded Sucessfull.....");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?zeroDateTimeBehavior=convertToNull", "root", "");
            //p1.println("Databse Connected Sucessfully.......");
            String s1 = request.getParameter("fname");
            String s2 = request.getParameter("lname");
            String s3 = request.getParameter("user");
            String s4 = request.getParameter("pass");
            String s5 = request.getParameter("phno");
            String s6 = request.getParameter("add");
            String quer = "Insert into login values('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "','" + s6 + "');";
            Statement SS = C1.createStatement();
            SS.executeUpdate(quer);
            out.print("0");
        } catch (SQLException ex) {
            out.println("1");
        } catch (ClassNotFoundException ex) {
            
        }
    }
}
