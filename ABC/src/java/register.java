
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

/**
 *
 * @author garavit
 */
//   Enumeration files = m.getFileNames();
//        
//        while (files.hasMoreElements()) {
//            String upload = (String) files.nextElement();
//            String filename = m.getFilesystemName(upload);
//            out.println(filename);
//        }
//       
//        File file = new File("D:\\" + en + "");
//        file.mkdir();
public class register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // p1.println("Driver Loaded Sucessfull.....");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?zeroDateTimeBehavior=convertToNull", "root", "");
            //p1.println("Databse Connected Sucessfully.......");
            Statement SS = C1.createStatement();
            String quer;
            String quer1;
            ResultSet rs;
            String eventid = request.getParameter("eventid");
            String eventname=request.getParameter("eventname");
            String user = (String) session.getAttribute("user");

            quer = "select * from event_reg where User_Name='" + user + "' and Event_Code='" + eventid + "';";
            quer1 = "Insert into event_reg values('" + user + "','" + eventname + "','" + eventid + "');";
            rs = SS.executeQuery(quer);
            if (rs.next() || user == null) {
            } else {
                SS.executeUpdate(quer1);
                out.print("1");
            }
            out.print("0");
        } catch (SQLException ex) {
            out.println("1");
        } catch (ClassNotFoundException ex) {

        }
    }
}