<%-- 
    Document   : forgot.jsp
    Created on : 17 Nov, 2016, 11:06:28 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Navigationbar.css">
        <link rel="stylesheet" href="css/Profile.css">
        <link rel="stylesheet" href="css/Editor.css">
        <link rel="stylesheet" href="css/Home.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="Lined_Plugins/jquery-linedtextarea.js"></script>
        <link href="Lined_Plugins/jquery-linedtextarea.css" type="text/css" rel="stylesheet" />
        <title>Forgot Password | CodeVilla</title>
    </head>
    <body>
        <a id="myPage" ></a>
        <div class="container-fluid" style="padding-top:70px;overflow-x: hidden;padding-left: 0px;padding-right: 0px;">

            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-default navbar-fixed-top" style="border-color: rgba(231, 231, 231, 0.45)!important;">
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
                                    <li ><a href="MainEvent.jsp">EVENTS</a></li>
                                    <li ><a href="MainEditor.html">EDITOR</a></li>
                                    <li class="active activeself"><a href="Profile.jsp">PROFILE</a></li>
                                    <li><a href="Logout">LOGOUT</a></li> 
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row edi" style="margin-bottom: 25px" >

                <div style="margin-left: 12%;margin-right: 10%;width:85%">

                    <div class="row" style="clear: left">
                        <div class="col-sm-11 editor">
                            <h3>Please Enter Your User Name :</h3>
                            <form class="form" action="pwd" method="get"> 
                                <input class="form-control" placeholder="Enter Username" type="email" name="uname" style="width: 40%" required><br>
                                <button class="btn btn-info" style="float: left;margin-top: 5px;width: 20%" type="submit">Next</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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

    </body>
</html>
