/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
public class Profile1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/HTML");
            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?zeroDateTimeBehavior=convertToNull", "root", "");
            Statement SS = C1.createStatement();
            String quer;
            String quer1;
            ResultSet rs;
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            String unicode = request.getParameter("unicode");
            String user = (String) session.getAttribute("user");
            switch (unicode) {
                case "1":
                    String edu = request.getParameter("edu");
                    quer = "select * from education where User_Name='" + user + "' and edu='" + edu + "';";
                    quer1 = "Insert into education values('" + user + "','" + edu + "');";
                    rs = SS.executeQuery(quer);
                    if (rs.next() ||user == null) {
                    } else {
                        SS.executeUpdate(quer1);
                        out.print("1");
                    }
                    break;
                case "2":
                    String lan = request.getParameter("lan");
                    quer = "select * from language where User_Name='" + user + "' and lan='" + lan + "';";
                    quer1 = "Insert into language values('" + user + "','" + lan + "');";
                    rs = SS.executeQuery(quer);
                    if (rs.next() ||user == null) {
                    } else {
                        SS.executeUpdate(quer1);
                        out.print("2");
                    }
                    break;
                case "3":
                    String fra = request.getParameter("fra");
                    quer = "select * from framework where User_Name='" + user + "' and fra='" + fra + "';";
                    quer1 = "Insert into framework values('" + user + "','" + fra + "');";
                    rs = SS.executeQuery(quer);
                    if (rs.next()||user == null) {
                    } else {
                        SS.executeUpdate(quer1);
                        out.print("3");
                    }
                    break;
                case "4":
                    String proj = request.getParameter("proj");
                    quer = "select * from project where User_Name='" + user + "' and proj='" + proj + "';";
                    quer1 = "Insert into project values('" + user + "','" + proj + "');";
                    rs = SS.executeQuery(quer);
                    if (rs.next()||user == null) {
                    } else {
                        SS.executeUpdate(quer1);
                        out.print("4");
                    }
                    break;
                case "5":
                    String pub = request.getParameter("pub");
                    quer = "select * from publication where User_Name='" + user + "' and pub='" + pub + "';";
                    quer1 = "Insert into publication values('" + user + "','" + pub + "');";
                    rs = SS.executeQuery(quer);
                    if (rs.next()||user == null) {
                    } else {
                        SS.executeUpdate(quer1);
                        out.print("5");
                    }
                    break;
                case "6":
                    String ach = request.getParameter("ach");
                    quer = "select * from achivement where User_Name='" + user + "' and ach='" + ach + "';";
                    quer1 = "Insert into achivement values('" + user + "','" + ach + "');";
                    rs = SS.executeQuery(quer);
                    if (rs.next()||user == null) {
                    } else {
                        SS.executeUpdate(quer1);
                        out.print("6");
                    }
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Profile1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
