<%-- 
    Document   : Events
    Created on : 11 Sep, 2016, 2:48:54 PM
    Author     : garavit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Profile</title>

        <link rel="stylesheet" href="CSS/Login_style.css"> 
        <link rel="stylesheet" href="CSS/Event.css"> 
        <link rel="stylesheet" href="CSS/Header.css">
        <link rel="stylesheet" href="CSS/profilestyle.css">
        <script src="js/jquery.min.js"></script>
        <script src="jquery_countdown/jquery.countdown.js"></script>
        <script src="jquery_countdown/jquery.countdown.min.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script>
            <%
                java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?", "root", "");
                Statement SS = C1.createStatement();
                String quer;
                ResultSet rs;

            %>
            function load()
            {
            <% 
                quer = "select * from events_info;";
                rs = SS.executeQuery(quer);
                while (rs.next()) {
                    String eventid = rs.getString("Event_Code");
                    out.print("$('#start_" + eventid + "').hide();");
                }
                quer = "select * from event_reg;";
                rs = SS.executeQuery(quer);
                while (rs.next()) {
                    String eventid = rs.getString("Event_Code");
                    out.print("$('#start_" + eventid + "').show();"
                            + "$('#"+eventid + "').hide();");
                }
            %>

            }
        </script>
        <%
            response.setContentType("text/html");
            HttpSession session1 = request.getSession();
            if (session1.isNew()) {
//                out.print("<script>"
//                        + "window.location.replace('http://localhost:8080/ABC/Logout');"
//                        + "</script>");

            } else {
//                
            }
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (Exception e) {
            }


        %>
    </head>
    <body onload="load()">

        <div class="header" style="position:fixed; z-index:99999;alignment-adjust: central;  width:100%;">
            <ul  style="clear:left;float:right;">
                <li id="welcome" class="welcome">
                    <%                        String fname = (String) session.getAttribute("fname");
                        String lname = (String) session.getAttribute("lname");
                        out.print("Welcome " + fname + " " + lname + "...!");
                    %>
                </li>
                <li><a href="AdminLogout">Logout</a></li>
                <li><a  href="Profile.jsp">My Profile</a></li>
                <li><a  href="Editor.html">Editor</a></li>
                <li><a class="active" href="#events">Events</a></li>
            </ul>
        </div>
        <div class="liveevents">
            <div class="eventsheader activeevent" style="width: 12%;background: #2780e3!important;color: white">
                <a class="active" style="text-decoration: none;color: white;padding: 5px;" href="#Liveevents">
                    Live Events
                </a>
            </div>
            <div class="eventsheader">
                <a style="text-decoration: none;color: #2780e3;padding: 5px;" href="#Upcoming_Events">
                    Upcoming Events
                </a>
            </div>
            <div class="eventsheader">
                <a style="text-decoration: none;color: #2780e3;padding: 5px;" href="#Previous_Events">
                    Previous Events
                </a>
            </div>
        </div>
        <div class="leaderboard">
            <div class="panel-heading">Leader Board</div>
            <div class="ranklist">
                <table style="width: 100%">
                    <tr><th>Rank</th><th>UserName</th></tr>
                    <tr><td>1</td><td>Garvit</td></tr>
                    <tr><td>2</td><td>Rohan</td></tr>
                    <tr><td>3</td><td>Meet</td></tr>
                    <tr><td>4</td><td>Sagar</td></tr>
                    <tr><td>5</td><td>Sagar Patel</td></tr>
                </table>
                <div style="color:black;padding: 10px;text-align: center;text-decoration: underline;cursor: pointer">View Next 5</div>
            </div>
        </div>
        <div>
            <ul style=" padding-left: 0px!important;width:68%">
                <%
                    quer = "select * from events_info order by Event_Date , Event_Stime";

                    rs = SS.executeQuery(quer);
                    while (rs.next()) {
                        String eventname = rs.getString("Event_Name");
                        String orgname = rs.getString("Org_Name");
                        String eventdesc = rs.getString("Event_Desc");
                        String eventid = rs.getString("Event_Code");
                        String eventdate = rs.getString("Event_Date");
                        String eventtime = rs.getString("Event_Stime");

                        out.print("<li style='float:left;width: 103%!important;'>"
                                + "<div class='prof' style='float: left;margin-top:30px'>");
                        out.print("<div class='panel-heading'>" + eventname + "<span style='float:right' id='timer_" + eventid + "'></span>" + "</div>"
                                + "<div class='panel'>"
                                + "<div class='entercontest'>"
                                + "<button type='button' id='" + eventid + "'>Register</button>"
                                + "<button type='button' id='start_" + eventid + "' style='cursor: not-allowed;background-color:#c4d1df!important' disabled>Start Contest</button>"
                                + "</div>"
                                + "<div class='discription'>"
                                + "<span style='color:#005c81'>Organizer Name : </span>" + orgname
                                + "</div>"
                                + "<div class='discription'>"
                                + "<span style='color:#005c81'>Event Description : </span>" + eventdesc
                                + " </div>"
                                + "<div class='discription'>"
                                + "<span style='color:#005c81'>Event Date : </span>" + eventdate
                                + "</div>"
                                + "<div class='discription'>"
                                + "<span style='color:#005c81'>Event Time : </span>" + eventtime
                                + "</div>"
                                + " </div>"
                                + "</li>"
                        );
                    }
                %>
            </ul>

        </div>
        <div id="Upcoming_Events"></div>
        <script>
            <%
                quer = "select * from event_info;";
                rs = SS.executeQuery(quer);
                while (rs.next()) {
                    String eventname = rs.getString("Event_Name");
                    String eventid = rs.getString("Event_Code");
                    String eventdate = rs.getString("Event_Date");
                    String eventtime = rs.getString("Event_Stime");
                    //out.print("alert("+eventdate+")");
                    out.print("$('#" + eventid + "').click(function () {"
                            + "$('#start_" + eventid + "').show();"
                            + "$('#" + eventid + "').hide();"
                            + "var eventid=\"" + eventid + "\";"
                            + "var eventname='" + eventname + "';"
                            + "var xmlhttp = new XMLHttpRequest();"
                            + "var uri=encodeURIComponent(eventid);"
                            + "var uri1=encodeURIComponent(eventname);"
                            + "xmlhttp.open('GET', 'register?eventid='+uri+ '&eventname=' + uri1, true);"
                            + "xmlhttp.send();"
                            + "});"
                            + "$('#timer_" + eventid + "').countdown('" + eventdate + " " + eventtime + "', function (event) {"
                            + "$(this).text(event.strftime('%D days %H:%M:%S'));"
                            + "});");
                }

            %>
            $(document).ready(function () {
                $('a[href^="#"]').on('click', function (e) {
                    e.preventDefault();

                    var target = this.hash;
                    var $target = $(target);

                    $('html, body').stop().animate({
                        'scrollTop': $target.offset().top
                    }, 1200, 'swing', function () {
                        window.location.hash = target;
                    });
                });
            });
        </script>
    </body>
</html>
