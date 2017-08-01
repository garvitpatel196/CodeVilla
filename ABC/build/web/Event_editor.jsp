<%-- 
    Document   : Event_editor
    Created on : 2 Oct, 2016, 10:33:36 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Editor</title>
        <link rel="stylesheet" href="Login_style.css"> 
        <link rel="stylesheet" href="Header.css">
        <script src="jquery.min.js"></script>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="profilestyle.css">
        <script src="jquery-linedtextarea.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

        <link href="jquery-linedtextarea.css" type="text/css" rel="stylesheet" />

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script>
            function sess()
            {
                $("#tcs").hide();
            }


        </script>

    </head>

    <body onload="sess()">
        <div style="position:fixed; z-index:99999;alignment-adjust: central;  width:100%;">
            <ul style="clear:left;float:right;">
                <li id="welcome" class="welcome"></li>
                <li><a href="Logout">Logout</a></li>
                <li><a href="Profile.jsp">My Profile</a></li>
                <li><a class="active" href="#Editor">Editor</a></li>
                <li><a href="Events.html">Events</a></li>
            </ul>
        </div>


        <div  style="padding-top:100px; border-top-width: 221px;top: 100px">
            <button type="button" class="cr" id="show"  data-target="#demo" data-toggle="collapse">Compile & Run</button>  
        </div>
        <div id="demo" class="collapse">
            <div class="prof">

                <div class="panel-heading" align="center">Output</div>
                <div class="panel">
                    <center>
                        <table border="1" style="width:40%" id="tcs" >
                            <tr style="text-align: center" >
                                <th> Testcases </th>
                                <th> Status </th>
                                <th> Error </th>
                            </tr>

                            <tr>
                                <td> Test Case 1 </td>
                                <td> Passed </td>
                                <td> No error </td>
                            </tr>



                        </table>
                    </center>
                </div>
            </div>
        </div>



        <script>
            <%

                Class.forName("com.mysql.jdbc.Driver");
                Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?", "root", "");
                Statement SS = C1.createStatement();
                
                String str = "select Test_case from events_info where Event_Code='1004'";
                ResultSet rs;

                int tc;
                rs = SS.executeQuery(str);
                rs.next();
                tc = rs.getInt("Test_case");


            %>
            var t = '<%=tc%>';
            var nt = 2;
            $("#show").click(function (e) {

                while (t > 0)
                {
                    $('#tcs').show();
                    $('#tcs').append("<tr><td>Test Case" + nt + "</td> <td> Failed</td> <td> Error </td> </tr>");

                    t--;
                }

            });

        </script>


        <!--                            +"< td > Test Case " + t + " < /td>" 
                                    +"< td > Passed < /td>" 
                                    +"< td > No error < /td>" 
                                    +"< /tr>"-->


    </body>


</html>
