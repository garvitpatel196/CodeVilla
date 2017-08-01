
import com.oreilly.servlet.MultipartRequest;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class UploadServlet extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        //doGet(req, resp);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        // String en = req.getParameter("eventname");
//        out.print("successfully uploaded: ");

        MultipartRequest m = new MultipartRequest(req, "d:/new");
        out.println("start");
        HttpSession sess = req.getSession();
        String un = (String) sess.getAttribute("user");
        String en = m.getParameter("eventname");
        String on = m.getParameter("orgname");
        String ed = m.getParameter("eventdesc");
        String er = m.getParameter("eventrules");
        String ep = m.getParameter("eventprize");
        String edt = m.getParameter("eventdate");
        String est = m.getParameter("eventst");
        String eet = m.getParameter("eventet");
        String qn = m.getParameter("qusname");
        String qd = m.getParameter("qusdesc");
        String si = m.getParameter("Sampin");
        String so = m.getParameter("Sampout");
        String tcs = m.getParameter("ntest");
        String link = "localhost:8080/ABC_beta/"+en+".jsp";
        
        out.println("OK");

        int code = (int) (((Math.random()) * 6) + 100);

        out.println("Result is " + (int) (((Math.random()) * 6) + 100));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?", "root", "");
            Statement SS = C1.createStatement();

            String str2 = "insert into events_qus values('" + un + "','" + en + "','" + qn + "','" + qd + "','" + si + "','" + so + "','" + tcs + "')";

            SS.executeUpdate(str2);

            while (true) {
                String search = "select * from events_info where Event_Code='" + code + "'";
                ResultSet rs;
                rs = SS.executeQuery(search);

                if (rs.next()) {
                    code = (int) (((Math.random()) * 6) + 1000);
                } else {
                    String str1 = "insert into events_info values('" + un + "','" + on + "','" + en + "','" + ed + "','" + code + "','" + edt + "','" + est + "','" + eet + "','" + tcs + "','" + link + "')";
                    String str = "insert into event_reg values('" + un + "','" + en + "','" + code + "')";
                    SS.executeUpdate(str);
                    SS.executeUpdate(str1);
                    break;
                }

            }
        } catch (Exception e) {
            System.out.println("ERROR");
        }

        
    }
}
