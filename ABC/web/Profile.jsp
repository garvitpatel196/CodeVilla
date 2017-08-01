<%-- 
    Document   : Profile
    Created on : 29 Aug, 2016, 9:29:56 PM
    Author     : garavit
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
        <link rel="stylesheet" href="Login_style.css"> 
        <link rel="stylesheet" href="Header.css">
        <link rel="stylesheet" href="profilestyle.css">
        <script src="jquery.min.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
            response.setContentType("text/html");
            String user = (String) session.getAttribute("user");
            HttpSession session1 = request.getSession();
            if (session1.isNew()) {
                out.print("<script>"
                        + "window.location.replace('http://localhost:8080/ABC/Logout');"
                        + "</script>");

            } else {
//                
            }
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (Exception e) {
            }


        %>
        <!--        <script>
                    function sess() {
                        $("#s1").prop("style", "display:none");
                        $("#s2").prop("style", "display:none");
                        $("#s3").prop("style", "display:none");
                        $("#s4").prop("style", "display:none");
                        $("#s5").prop("style", "display:none");
                        $("#s6").prop("style", "display:none");
                        $("#s1").hide();
                        $("#s2").hide();
                        $("#s3").hide();
                        $("#s4").hide();
                        $("#s5").hide();
                        $("#s6").hide();
                    }
        
                </script>-->
        <script>
            function sess() {
                $("#addedu").hide();
                $("#addpub").hide();
                $("#addproj").hide();
                $("#addach").hide();
                $("#addlan").hide();
                $("#addfra").hide();
                $("#remedu").hide();
                $("#rempub").hide();
                $("#remproj").hide();
                $("#remach").hide();
                $("#remlan").hide();
                $("#remfra").hide();
            }
        </script>
    </head>
    <body onload="sess()">
        <%  java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?zeroDateTimeBehavior=convertToNull", "root", "");
            Statement SS = C1.createStatement();
            String quer;
            String quer1;
            ResultSet rs;
        %>
        
        
        <div style="position:fixed; z-index:99999;alignment-adjust: central;  width:100%;">
            <ul style="clear:left;float:right;">
                <li id="welcome" class="welcome">
                    <%
                        String fname = (String) session.getAttribute("fname");
                        String lname = (String) session.getAttribute("lname");
                        out.print("Welcome " + fname + " " + lname + "...!");
                    %>
                </li>
                <li><a href="Logout">Logout</a></li>
                <li><a class="active" href="#profile">My Profile</a></li>
                <li><a  href="Editor.html">Editor</a></li>
                <li><a href="Events.html">Events</a></li>
            </ul>
        </div>
                

        <div class="prof" style="float: left;margin-top: 100px!important;">
            <div class="panel-heading">
                Personal Details
            </div>
            <div class="panel">
                <form name="Pers_Detail" class="detail">
                    <table>
                        <tr>
                            <td><label for="fname">First Name:</label></td>
                            <td><input type="text" id="fn" name="fname" value='<%=session.getAttribute("fname")%>' disabled/></td>
                            <td class="edit"><button type="button" id="b1" >Edit</button></td>
                        </tr>
                        <tr>
                            <td><label for="lname">Last Name:</label></td>
                            <td><input type="text" id="ln" name="lname" value='<%=session.getAttribute("lname")%>' disabled/> </td>
                            <td class="edit"><button type="button" id="b2" >Edit</button></td>
                        </tr>
                        <tr>
                            <td><label for="user">UserName:</label></td>
                            <td><input type="email" id="us" name="user" value='<%=session.getAttribute("user")%>' disabled/></td>
                            <td class="edit"><button type="button" id="b3" >Edit</button></td>
                        </tr>
                        <tr>
                            <td><label for="pass">Password:</label></td>
                            <td><input type="password" id="pa" name="pass" value='<%=session.getAttribute("pass")%>' disabled/></td>
                            <td class="edit"><button class="edit" type="button" id="b4" >Edit</button></td>
                        </tr>
                        <tr>
                            <td><label for="phno" >Ph.Number:</label></td>
                            <td><input type="text" id="pn" name="phno" value='<%=session.getAttribute("phno")%>' disabled/></td>
                            <td class="edit"><button type="button" id="b5" >Edit</button></td>
                        </tr>
                        <tr>
                            <td><label for="add">Address:</label></td>
                            <td><input type="text" id="ad" name="add" value='<%=session.getAttribute("add")%>' disabled/></td>
                            <td class="edit"><button type="button" id="b6" >Edit</button></td>
                        </tr>
                    </table>
                    <div class="save">
                        <button id="s1" type="button" style="display: none">Save Changes</button>
                    </div>

                </form>
            </div> 
        </div>


        <div class="prof" style="float: left;">
            <div class="panel-heading">
                Education
            </div>
            <div class="panel">
                <div id="EDU" class="addprof">
                    <ul id="eduul">
                        <%
                            quer = "select * from education where User_Name='" + user + "';";
                            rs = SS.executeQuery(quer);
                            while (rs.next()) {
                                String ans = rs.getString("edu");
                                out.print("<li id='"+ans+"' >"
                                        + ans
                                        + "</li>");
                            }
                        %>
                    </ul>
                </div>
                <div id="addedu" class="addprof">
                    <form method="get" id="eduform" style="float:left;" >
                        <input type="text" id="edu" placeholder="Add" required/><button type="button" id="addb1">Add</button>
                    </form>
                </div>
                <div id="remedu" class="addprof">
                    <form method="get" style="clear: left;">
                        <select id="edusec">
                            <%
                                quer = "select * from education where User_Name='" + user + "';";
                                rs = SS.executeQuery(quer);
                                while (rs.next()) {
                                    String ans = rs.getString("edu");
                                    out.print("<option value='"+ans+"' >"
                                            + ans
                                            + "</option>");
                                }
                            %>
                        </select><button type="button" id="remb1">Remove</button>
                    </form>
                </div>
                <div id="addedu1" class="add" style="float: left;clear: left">
                    <div class="wrap-plus">
                        <img src="add.gif" style="width: 30px; padding: 5px;" alt="Add Education">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 12px;">Add Education</div>
                </div>
                <div id="remedu1" class="add">
                    <div class="wrap-plus">
                        <img src="Remove.gif" style="width: 40px;padding: 0px;height: 37px;" alt="Remove Education">
                    </div>
                    <div style="margin-bottom: 20px; padding-top:10px;">Remove Education</div>
                </div>
            </div>    
        </div>

                        
        <div class="prof" style="float: left;">
            <div class="panel-heading">
                Programming Languages
            </div>
            <div class="panel">
                <div id="LAN" class="addprof">
                    <ul id="lanul">
                        <%
                            quer = "select * from language where User_Name='" + user + "';";
                            rs = SS.executeQuery(quer);
                            while (rs.next()) {
                                String ans = rs.getString("lan");
                                out.print("<li id='"+ans+"' >"
                                        + ans
                                        + "</li>");
                            }
                        %>
                    </ul>
                </div>
                <div id="addlan" class="addprof">
                    <form action="Profile.jsp" style="float:left;">
                        <input type="text" id="lan" placeholder="Add" required/><button type="button" id="addb2">Add</button>
                    </form>
                </div>
                <div id="remlan" class="addprof">
                    <form method="get" action="" style="clear: left;">
                        <select id="lansec">
                            <%
                                quer = "select * from language where User_Name='" + user + "';";
                                rs = SS.executeQuery(quer);
                                while (rs.next()) {
                                    String ans = rs.getString("lan");
                                    out.print("<option value='"+ans+"' >"
                                            + ans
                                            + "</option>");
                                }
                            %>
                        </select><button type="button" id="remb2">Remove</button>
                    </form>
                </div>
                <div id="addlan1" class="add" style="float: left;clear: left">
                    <div class="wrap-plus">
                        <img src="add.gif" style="width: 30px; padding: 5px;" alt="Add Programming Language">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 12px;">Add Languages</div>
                </div>
                <div id="remlan1" class="add">
                    <div class="wrap-plus">
                        <img src="Remove.gif" style="width: 40px;padding: 0px;height: 37px;" alt="Remove Programming Language">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 10px;">Remove Programming Language</div>
                </div>
            </div>
        </div>


        <div class="prof" style="float: left;">
            <div class="panel-heading">
                Frameworks
            </div>
            <div class="panel">
                <div id="FRA" class="addprof">
                    <ul id="fraul">
                        <%
                            quer = "select * from framework where User_Name='" + user + "';";
                            rs = SS.executeQuery(quer);
                            while (rs.next()) {
                                String ans = rs.getString("fra");
                                out.print("<li id='"+ans+"' >"
                                        + ans
                                        + "</li>");
                            }
                        %>
                    </ul>
                </div>
                <div id="addfra" class="addprof" style="float:left;">
                    <form>
                        <input type="text" id="fra" placeholder="Add" required/><button type="button" id="addb3">Add</button>
                    </form>
                </div>
                <div id="remfra" class="addprof">
                    <form method="get" action="" style="clear: left;">
                        <select id="frasec">
                            <%
                                quer = "select * from framework where User_Name='" + user + "';";
                                rs = SS.executeQuery(quer);
                                while (rs.next()) {
                                    String ans = rs.getString("fra");
                                    out.print("<option value='"+ans+"' >"
                                            + ans
                                            + "</option>");
                                }
                            %>
                        </select><button type="button" id="remb3">Remove</button>
                    </form>
                </div>
                <div id="addfra1" class="add" style="float: left;clear: left">
                    <div class="wrap-plus">
                        <img src="add.gif" style="width: 30px; padding: 5px;" alt="Add Framework">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 12px;">Add Frameworks</div>
                </div>
                <div id="remfra1" class="add">
                    <div class="wrap-plus">
                        <img src="Remove.gif" style="width: 40px;padding: 0px;height: 37px;" alt="Remove Framework">
                    </div>
                    <div style="margin-bottom: 20px;padding-top: 10px;">Remove Framework</div>
                </div>
            </div>
        </div>


        <div class="prof" style="float: left;">
            <div class="panel-heading">
                Projects
            </div>
            <div class="panel">
                <div id="PROJ" class="addprof">
                    <ul id="projul">
                        <%
                            quer = "select * from project where User_Name='" + user + "';";
                            rs = SS.executeQuery(quer);
                            while (rs.next()) {
                                String ans = rs.getString("proj");
                                out.print("<li id='"+ans+"' >"
                                        + ans
                                        + "</li>");
                            }
                        %>
                    </ul>
                </div>
                <div id="addproj" class="addprof" style="float:left;">
                    <form>
                        <input type="text" id="proj" placeholder="Add" required/><button type="button" id="addb4">Add</button>
                    </form>
                </div>
                <div id="remproj" class="addprof">
                    <form method="get" action="" style="clear: left;">
                        <select id="projsec">
                            <%
                                quer = "select * from project where User_Name='" + user + "';";
                                rs = SS.executeQuery(quer);
                                while (rs.next()) {
                                    String ans = rs.getString("proj");
                                    out.print("<option value='"+ans+"' >"
                                            + ans
                                            + "</option>");
                                }
                            %>
                        </select><button type="button" id="remb4">Remove</button>
                    </form>
                </div>
                <div id="addproj1" class="add" style="float: left;clear: left">
                    <div class="wrap-plus">
                        <img src="add.gif" style="width: 30px; padding: 5px;" alt="Add Projects">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 12px;">Add a Project</div>
                </div>
                <div id="remproj1" class="add">
                    <div class="wrap-plus">
                        <img src="Remove.gif" style="width: 40px;padding: 0px;height: 37px;" alt="Remove a Project">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 10px;">Remove a Project</div>
                </div>
            </div>
        </div>


        <div class="prof" style="float: left;">
            <div class="panel-heading">
                Publications
            </div>
            <div class="panel">
                <div id="PUB" class="addprof">
                    <ul id="pubul">
                        <%
                            quer = "select * from publication where User_Name='" + user + "';";
                            rs = SS.executeQuery(quer);
                            while (rs.next()) {
                                String ans = rs.getString("pub");
                                out.print("<li id='"+ans+"' >"
                                        + ans
                                        + "</li>");
                            }
                        %>
                    </ul>
                </div>
                <div id="addpub" class="addprof" style="float:left;">
                    <form>
                        <input type="text" id="pub" placeholder="Add" required/><button type="button" id="addb5">Add</button>
                    </form>
                </div>
                <div id="rempub" class="addprof">
                    <form method="get" action="" style="clear: left;">
                        <select id="pubsec">
                            <%
                                quer = "select * from publication where User_Name='" + user + "';";
                                rs = SS.executeQuery(quer);
                                while (rs.next()) {
                                    String ans = rs.getString("pub");
                                    out.print("<option value='"+ans+"' >"
                                            + ans
                                            + "</option>");
                                }
                            %>
                        </select><button type="button" id="remb5">Remove</button>
                    </form>
                </div>
                <div id="addpub1" class="add" style="float: left;clear: left">
                    <div class="wrap-plus">
                        <img src="add.gif" style="width: 30px; padding: 5px;" alt="Add Publications">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 12px;">Add a Publication</div>
                </div>
                <div id="rempub1" class="add">
                    <div class="wrap-plus">
                        <img src="Remove.gif" style="width: 40px;padding: 0px;height: 37px;" alt="Add Publication">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 10px;">Remove Publication</div>
                </div>
            </div>
        </div>


        <div class="prof" style="float: left; margin-bottom:40px!important;">
            <div class="panel-heading">
                Achievements
            </div>
            <div class="panel">
                <div id="ACH" class="addprof">
                    <ul id="achul">
                        <%
                            quer = "select * from achivement where User_Name='" + user + "';";
                            rs = SS.executeQuery(quer);
                            while (rs.next()) {
                                String ans = rs.getString("ach");
                                out.print("<li id='"+ans+"' >"
                                        + ans
                                        + "</li>");
                            }
                        %>
                    </ul>
                </div>
                <div id="addach" class="addprof" style="float:left;">
                    <form>
                        <input type="text" id="ach" placeholder="Add" required/><button type="button" id="addb6">Add</button>
                    </form>
                </div>
                <div id="remach" class="addprof">
                    <form method="get" action="" style="clear: left;">
                        <select id="achsec">
                            <%
                                quer = "select * from achivement where User_Name='" + user + "';";
                                rs = SS.executeQuery(quer);
                                while (rs.next()) {
                                    String ans = rs.getString("ach");
                                    out.print("<option value='"+ans+"' >"
                                            + ans
                                            + "</option>");
                                }
                            %>
                        </select><button type="button" id="remb6">Remove</button>
                    </form>
                </div>
                <div id="addach1" class="add" style="float: left;clear: left">
                    <div class="wrap-plus">
                        <img src="add.gif" style="width: 30px; padding: 5px;" alt="Add Achivements">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 12px;">Add an Achievements</div>
                </div>
                <div id="remach1" class="add">
                    <div class="wrap-plus">
                        <img src="Remove.gif" style="width: 40px;padding: 0px;height: 37px;" alt="Add Achivements">
                    </div>
                    <div style="margin-bottom: 20px; padding-top: 12px;">Remove Achivements</div>
                </div>
            </div>
        </div>


        <script>
            $('#remedu1').click(function () {
                $("#remedu").show();
                $("#addedu").hide();
            });
            $('#remfra1').click(function () {
                $("#remfra").show();
                $("#addfra").hide();
            });
            $('#rempub1').click(function () {
                $("#rempub").show();
                $("#addpub").hide();
            });
            $('#remproj1').click(function () {
                $("#remproj").show();
                $("#addproj").hide();
            });
            $('#remlan1').click(function () {
                $("#remlan").show();
                $("#addlan").hide();
            });
            $('#remach1').click(function () {
                $("#remach").show();
                $("#addach").hide();
            });
            
            $('#remb1').click(function () {
                $("#remedu").hide();
                var edu = document.getElementById("edusec").value;
                if (edu !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 1)
                            {     
                                $("#edusec option[value='"+edu+"']").remove();
                                $("#"+edu).remove();
                            }
                            else
                            {
                                
                            }
                        }
                    };
                    var uri = encodeURIComponent(edu);
                    xmlhttp.open("GET", "remprof?unicode=1&edu=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb2').click(function () {
                $("#remlan").hide();
                var lan = document.getElementById("lansec").value;
                if (lan !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 2)
                            {
                                $("#lansec option[value='"+lan+"']").remove();
                                $("#"+lan).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(lan);
                    xmlhttp.open("GET", "remprof?unicode=2&lan=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb3').click(function () {
                $("#remfra").hide();
                var fra = document.getElementById("frasec").value;
                if (fra !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 3)
                            {
                                $("#frasec option[value='"+fra+"']").remove();
                                $("#"+fra).remove();
                            }
                            else
                            {
                            }
                        }
                    };
                    var uri = encodeURIComponent(fra);
                    xmlhttp.open("GET", "remprof?unicode=3&fra=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb4').click(function () {
                $("#remproj").hide();
                var proj = document.getElementById("projsec").value;
                if (proj !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 4)
                            {
                                $("#projsec option[value='"+proj+"']").remove();
                                $("#"+proj).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(proj);
                    xmlhttp.open("GET", "remprof?unicode=4&proj=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb5').click(function () {
                $("#rempub").hide();
                var pub = document.getElementById("pubsec").value;
                if (pub !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 5)
                            {
                                $("#pubsec option[value='"+pub+"']").remove();
                                $("#"+pub).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(pub);
                    xmlhttp.open("GET", "remprof?unicode=5&pub=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#remb6').click(function () {
                $("#remach").hide();
                var ach = document.getElementById("achsec").value;
                if (ach !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 6)
                            {
                                $("#achsec option[value='"+ach+"']").remove();
                                $("#"+ach).remove();
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(ach);
                    xmlhttp.open("GET", "remprof?unicode=6&ach=" + uri, true);
                    xmlhttp.send();
                }
            });
        </script>
        <script>
            $('#addedu1').click(function () {
                $("#addedu").show();
                $("#remedu").hide();
            });
            $('#addfra1').click(function () {
                $("#addfra").show();
                $("#remfra").hide();
            });
            $('#addpub1').click(function () {
                $("#addpub").show();
                $("#rempub").hide();
            });
            $('#addproj1').click(function () {
                $("#addproj").show();
                $("#remproj").hide();
            });
            $('#addlan1').click(function () {
                $("#addlan").show();
                $("#remlan").hide();
            });
            $('#addach1').click(function () {
                $("#addach").show();
                $("#remach").hide();
            });

            $("#prospects_form").submit(function (e) {
                e.preventDefault();
            });

            $('#addb1').click(function () {
                $("#addedu").hide();
                var edu = document.getElementById("edu").value;
                if (edu !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 1)
                            {
                                $('#eduul').append("<li id='"+edu+"' >"+ edu + "</li>");
                                $('#edusec').append("<option value='"+edu+"' >" + edu + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(edu);
                    xmlhttp.open("GET", "Profile1?unicode=1&edu=" + uri, true);
                    xmlhttp.send();
                }

            });
            $('#addb2').click(function () {
                $("#addlan").hide();
                var lan = document.getElementById("lan").value;
                if (lan !== "")
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 2)
                            {
                                $('#lanul').append("<li id='"+lan+"' >" + lan + "</li>");
                                $('#lansec').append("<option value='"+lan+"' >" + lan + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(lan);
                    xmlhttp.open("GET", "Profile1?unicode=2&lan=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#addb3').click(function () {
                $("#addfra").hide();
                var fra = document.getElementById("fra").value;
                if (fra !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 3)
                            {
                                $('#fraul').append("<li id='"+fra+"' >" + fra + "</li>");
                                $('#frasec').append("<option value='"+fra+"' >" + fra + "</option>");
                            }
                            else
                            {
                            }
                        }
                    };
                    var uri = encodeURIComponent(fra);
                    xmlhttp.open("GET", "Profile1?unicode=3&fra=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#addb4').click(function () {
                $("#addproj").hide();
                var proj = document.getElementById("proj").value;
                if (proj !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 4)
                            {
                                $('#projul').append("<li id='"+proj+"' >" + proj + "</li>");
                                $('#projsec').append("<option value='"+proj+"' >" + proj + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(proj);
                    xmlhttp.open("GET", "Profile1?unicode=4&proj=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#addb5').click(function () {
                $("#addpub").hide();
                var pub = document.getElementById("pub").value;
                if (pub !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 5)
                            {
                                $('#pubul').append("<li id='"+pub+"' >" + pub + "</li>");
                                $('#pubsec').append("<option value='"+pub+"' >" + pub + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(pub);
                    xmlhttp.open("GET", "Profile1?unicode=5&pub=" + uri, true);
                    xmlhttp.send();
                }
            });
            $('#addb6').click(function () {
                $("#addach").hide();
                var ach = document.getElementById("ach").value;
                if (ach !== "") {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                            var x = parseInt(xmlhttp.responseText);
                            if (x === 6)
                            {
                                $('#achul').append("<li id='"+ach+"' >" + ach + "</li>");
                                $('#achsec').append("<option value='"+ach+"' >" + ach + "</option>");
                            }
                            else
                            {

                            }
                        }
                    };
                    var uri = encodeURIComponent(ach);
                    xmlhttp.open("GET", "Profile1?unicode=6&ach=" + uri, true);
                    xmlhttp.send();
                }
            });
        </script>
        <script>
            $('#b1').click(function () {
                $("#s1").show();
                //$("#s1").prop("style", "display:button");
                $('#fn').prop("disabled", false);
            });
            $('#s1').click(function () {
                $("#s1").prop("style", "display:none");
                $('#fn').prop("disabled", true);
                $('#ln').prop("disabled", true);
                $('#us').prop("disabled", true);
                $('#pa').prop("disabled", true);
                $('#pn').prop("disabled", true);
                $('#ad').prop("disabled", true);
                var fname = document.getElementById("fn").value;
                var lname = document.getElementById("ln").value;
                var user = document.getElementById("us").value;
                var pass = document.getElementById("pa").value;
                var phno = document.getElementById("pn").value;
                var add = document.getElementById("ad").value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                        var x = parseInt(xmlhttp.responseText);
                        if (x === 1)
                        {

                        }
                        else
                        {
                            document.location.reload();
                        }

                    }
                };
                var uri1 = encodeURIComponent(fname);
                var uri2 = encodeURIComponent(lname);
                var uri3 = encodeURIComponent(user);
                var uri4 = encodeURIComponent(pass);
                var uri5 = encodeURIComponent(phno);
                var uri6 = encodeURIComponent(add);
                xmlhttp.open("GET", "Profile?fname=" + uri1 + "&lname=" + uri2 + "&user=" + uri3 + "&pass=" + uri4 + "&phno=" + uri5 + "&add=" + uri6, true);
                xmlhttp.send();
            });
            $('#b2').click(function () {
                $("#s1").show();
                $('#ln').prop("disabled", false);
            });
            $('#b3').click(function () {
                $("#s1").show();
                $('#us').prop("disabled", false);
            });
            $('#b4').click(function () {
                $("#s1").show();
                $('#pa').prop("disabled", false);
            });
            $('#b5').click(function () {
                $("#s1").show();
                $('#pn').prop("disabled", false);
            });
            $('#b6').click(function () {
                $("#s1").show();
                $('#ad').prop("disabled", false);
            });
        </script>
    </body>
</html>