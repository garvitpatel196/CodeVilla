/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
public class check extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?", "root", "");
            Statement st = C1.createStatement();
            PrintWriter out = response.getWriter();
            String pwd = null;
            int c = 0;

            String mob = request.getParameter("mn");

            String str = "select Password from login where Phone_Number='" + mob + "' ";
            
            ResultSet rss = st.executeQuery(str);
           
            while (rss.next()) {
                c = 1;
                pwd = rss.getString("Password");
                
            }
           
            if (c == 1) {
                out.print("your password is " + pwd);
            } else {
                out.print("Invalid Mobile Number");
            }

        } catch (Exception e) {
            System.out.println("sdsd");
        }
    }

}
