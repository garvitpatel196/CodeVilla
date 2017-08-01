/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
public class pwd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?", "root", "");
            Statement st = C1.createStatement();
            PrintWriter out = response.getWriter();
            String un = null;
            int c = 0;

            String unm = request.getParameter("uname");

            String str = "select User_Name from login where User_Name='" + unm + "' ";

            ResultSet rss = st.executeQuery(str);

            while (rss.next()) {
                c = 1;

            }

            if (c == 1) {
                RequestDispatcher rd =request.getRequestDispatcher("next.jsp");
                        rd.forward(request, response);
            } else {
                out.print("Invalid UserName");
            }

        } catch (Exception e) {
            System.out.println("sdsd");
        }
    }

}
