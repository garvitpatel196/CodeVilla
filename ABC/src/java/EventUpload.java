/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EventUpload extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // p1.println("Driver Loaded Sucessfull.....");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?", "root", "");
            //p1.println("Databse Connected Sucessfully.......");
            Statement SS = C1.createStatement();
            String un = (String) session.getAttribute("user");
            String en = request.getParameter("enn");
            String eon = request.getParameter("eonn");
            String ed = request.getParameter("edn");
            String eda = request.getParameter("edan");
            String et = request.getParameter("etn");
            String ec="xyz";
            out.println("till");
            String quer = "Insert into events_info values('" + un + "','" + eon+ "','" + en + "','" + ed + "','" + ec + "','" + eda + "','" + et + "');";
            SS.executeUpdate(quer);
            out.println("Success");
            
        } catch (ClassNotFoundException | SQLException e) {
            out.println(e);
        }
    }

}
