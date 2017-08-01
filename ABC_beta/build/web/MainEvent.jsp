<%-- 
    Document   : MainEvent
    Created on : Oct 10, 2016, 8:33:22 PM
    Author     : Garvit Patel
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Navigationbar.css">
        <link rel="stylesheet" href="css/Timeline.css">
        <link rel="stylesheet" href="css/Home.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="jquery_countdown/jquery.countdown.js"></script>
        <script src="jquery_countdown/jquery.countdown.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <title>Events | CodeVilla</title>

        <script>
             <%
            response.setContentType("text/html");
            HttpSession session1 = request.getSession();
            if (session1.isNew()) {
                response.sendRedirect("index.html");
            } else {
//                
            }
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (Exception e) {
            }


        %>
            <%
                java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?", "root", "");
                Statement SS = C1.createStatement();
                String quer;
                ResultSet rs;

            %>
            function load()
            {
            <%                quer = "select * from event_info;";
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
                            + "$('#" + eventid + "').hide();");
                }
            %>

            }
        </script>
       
    </head>
    <body onload="load()">
        <a id="myPage" ></a>
        <div class="container-fluid" style="padding-top:40px;overflow-x: hidden;padding-left: 0px;padding-right: 0px;">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-default navbar-fixed-top">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>                        
                                </button>

                                <a class="navbar-brand" style="padding: 0px" href="AboutUs.html">
                                    <img alt="Company Logo" src="images/cv_logo.png" style="margin-left: 20px;margin-top: 5px;height: 40px;width: 40px;float: left;">
                                    <span class="cmpyname" style="margin-left: 5px;color: white;font-size: 30px;line-height: 47px;">CodeVilla</span>
                                </a>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav navbar-right navi">
                                    <li class="active activeself"><a href="MainEvent.jsp">EVENTS</a></li>
                                    <li ><a href="MainEditor.html">EDITOR</a></li>
                                    <li><a href="MainProfile.jsp">PROFILE</a></li>
                                    <li><a class="" href="Logout">LOGOUT</a></li>
                                    
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row content" style="padding-left: 15px;    padding-right: 15px;" >
                <div class="col-sm-3 sidenav" id="filter" style="background-color: #f1f1f1;">
                    <h4 style="padding: 25px;">Filter</h4>
                    <hr>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="#LIVE EVENTS">LIVE EVENTS</a></li>
                        <li><a href="#UPCOMING EVENTS">UPCOMING EVENTS</a></li>
                        <li><a href="#PAST EVENTS">PAST EVENTS</a></li>
                    </ul><br>
                    <br>
                </div>
                <div class="col-sm-9" id="timeline">
                    <h4 style="padding: 25px;"><small>LIVE EVENTS</small></h4>
                    <hr>
                    <ul class="timeline" style=" padding-left: 0px!important;width:100%">
                        <%                    quer = "select * from event_info order by Event_Date , Event_Stime";

                            rs = SS.executeQuery(quer);
                            while (rs.next()) {
                                String eventname = rs.getString("Event_Name");
                                String orgname = rs.getString("Org_Name");
                                String eventdesc = rs.getString("Event_Desc");
                                String eventid = rs.getString("Event_Code");
                                String eventdate = rs.getString("Event_Date");
                                String eventtime = rs.getString("Event_Stime");

                                out.print("<li style=''>"
                                        +"<time class='time' datetime='2013-04-10 18:30'>"
                                        + "<span>"+ eventdate+"</span>"
                                        //+ "<span>"+ eventtime+"</span>"
                                        + "<span id='timer_" + eventid + "'></span>" 
                                        + "</time>"
                                        + "<div class='icon'></div>"
                                        + "<div class='pan'>");
                                out.print("<div class='panhead' data-toggle='collapse' data-target='#body_" + eventid+ "'>" + eventname + "</div>"
                                        + "<div class='collapse' id='body_" + eventid+ "' style='height:fit-content'><div class='panbody'>"
                                        + "<div>"
                                        + "<button class='form-control' type='button' id='" + eventid + "'>Register</button>"
                                        + "<button class='form-control' type='button' onclick='openevent(\""+eventname+"\");' id='start_" + eventid + "' style=''>Start Contest</button>"
                                        + "</div>"
                                        + "<div>"
                                        + "<span style=''>Organizer Name : </span>" + orgname
                                        + "</div>"
                                        + "<div>"
                                        + "<span style=''>Event Description : </span>" + eventdesc
                                        + " </div></div>"
                                        + " </div>"
                                        + "</li>"
                                );
                            }
                        %>
                    </ul>

                </div>
            </div>
            <div class="row">
                <div id="footer" class="container aboutus" >
                    <center>
                        <a  href="#myPage" data-toggle="tooltip" id="toTop" title="" data-original-title="TO TOP">
                            <span class="glyphicon glyphicon-chevron-up"></span>
                        </a>
                        <footer>
                            <div>
                                <div class="text-center" style="cursor:pointer">
                                    <p style="font-size: 14px; margin-top: 5px; margin-bottom: 0px;"><span >
                                            <a target="_blank" >
                                                Contest Calendar
                                            </a> | 
                                            <a target="_blank">
                                                Blog
                                            </a> |
                                            <a target="_blank">
                                                Scoring
                                            </a> | 
                                            <a target="_blank" >
                                                Environment
                                            </a> | 
                                            <a target="_blank" >
                                                FAQ
                                            </a> |
                                        </span> 
                                        <a target="_blank">
                                            About Us
                                        </a> | 
                                        <a target="_blank">
                                            Support
                                        </a> | 
                                        <a target="_blank">
                                            Careers
                                        </a> |
                                        <a target="_blank">
                                            Terms Of Service
                                        </a> | 
                                        <a target="_blank">
                                            Privacy Policy
                                        </a> | 
                                        <a target="_blank">
                                            Request a Feature
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </footer>
                    </center>
                </div>
            </div>
        </div>
        <script>
            $('#filter').height($('#timeline').outerHeight());
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
                            + "$(this).text(event.strftime('%H:%M:%S'));"
                            + "});");
                }

            %>
            $(document).ready(function () {
                $("#toTop").on("click", function (event) {

                    event.preventDefault();
                    var hash = this.hash;
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function () {
                        window.location.hash = hash;
                    });

                });
                $(window).scroll(function () {
                    $(".slideanim").each(function () {

                        var pos = $(this).offset().top;
                        alert();
                        var winTop = $(window).scrollTop();

                        if (pos < winTop + 600) {
                            $(this).addClass("slide");
                        }
                    });
                });
            });
            function openevent(str)
            {
                //alert("localhost:8080/ABC_beta/EventDesc.jsp");
                window.open(str+'.html');
            }
        </script>
    </body>
</html>
