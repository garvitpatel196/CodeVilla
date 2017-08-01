<%-- 
    Document   : EventReg.jsp
    Created on : 13 Sep, 2016, 5:52:23 PM
    Author     : Lenovo
--%>

<%@page import="javafx.stage.FileChooser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="xyz.css"> 
        <link rel="stylesheet" href="Login_style.css"> 
        <link rel="stylesheet" href="Header.css">
        <link rel="stylesheet" href="profilestyle.css">
        <script src="jquery.min.js"></script>
        <!--        <link rel="stylesheet" href="D:\projeCT\ABC\web\bootstrap-3.3.7-dist\js\bootstrap.min.js">
                <link rel="stylesheet" href="D:\projeCT\ABC\web\bootstrap-3.3.7-dist\js\bootstrap.js">
        
                <link rel="stylesheet" href="D:\projeCT\ABC\web\bootstrap-3.3.7-dist\css\bootstrap.css">
                <link rel="stylesheet" href="D:\projeCT\ABC\web\bootstrap-3.3.7-dist\css\bootstrap.min.css">-->

        <script>
            function sess()
            {
                $("#atc").hide();
                $("#rmtc").hide();
                $("#addtcs").hide();


            }

        </script>
    </head>
    <body onload="sess()">
        <form action="UploadServlet" method="post" enctype="multipart/form-data">

            <div class="prof">
                <div class="panel-heading">Event Name</div>
                <div class="panel eventname">
                    <table>
                        <tr><td> Event Name :: </td>
                            <td> <input type="text" id="eventname" name="eventname" required> </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="prof">
                <div class="panel-heading">Event Organizer Name:</div>
                <div class="panel">

                    <table>
                        <tr><td> Event Organizer Name :: </td>
                            <td> <input type="text" id="eon" name="orgname" required> </td>
                        </tr>
                    </table>

                </div>
            </div>
            <div class="prof">
                <div class="panel-heading">Event Details</div>
                <div class="panel eventname">

                    <table>
                        <tr><td> Event Description :: </td>
                            <td> <input type="text" id="ed" name="eventdesc" required> </td>
                        </tr>
                        <tr><td> Event Rules :: </td>
                            <td> <input type="text" id="er" name="eventrules" required> </td>
                        </tr>
                        <tr><td> Event Prizes :: </td>
                            <td> <input type="text" id="ep" name="eventprize" required> </td>
                        </tr>
                        <tr><td> Event Date :: </td>
                            <td> <input type="date" id="edt" name="eventdate" required> </td>
                        </tr>
                        <tr><td> Event Starting Time :: </td>
                            <td> <input type="time" id="et" name="eventst" required> </td>
                        </tr>

                        <tr><td> Event Ending Time :: </td>
                            <td> <input type="time" id="et" name="eventet" required> </td>
                        </tr>

                    </table>

                </div>
            </div>

            <div class="prof">
                <div class="panel-heading">Event Question Details:</div>
                <div class="panel">

                    <table>

                        <tr><td>  Question Name :: </td>
                            <td> <input type="text" name="qusname" required> </td>
                        </tr>

                        <tr><td> Question Description :: </td>
                            <td> <textarea  name="qusdesc" cols="25" rows="8" style="background-color: #f2f2f2" required> </textarea></td>
                        </tr>
                        <tr><td> Sample Input :: </td>
                            <td> <textarea  name="Sampin" cols="25" rows="3" style="background-color: #f2f2f2" required>  </textarea></td>
                        </tr>
                        <tr><td> Sample output :: </td>
                            <td> <textarea  name="Sampout"  cols="25" rows="3" style="background-color: #f2f2f2" required> </textarea></td>
                        </tr>
                        <tr ><td> Number Of Test Cases :: </td>
                            <td> <input type="text"  id="ntcs" name="ntest"  required  style="margin-top: 15px"> </td>
                        </tr>
                    </table>


                    <div id="addtcs">
                        <div> Add Test Case 1 :: </div>
                        <div style="margin-left: 14.5%; width:17%">
                            Input File:  <input type="file" name="iname"/> </div>
                        <div style="width:12%; margin-left:33%; margin-right: 58%">

                        </div>
                        <div style="margin-left: 14.5%; width:17%; " >
                            Output File:  <input type="file" name="oname"/> </div>  

                    </div>

                    <div id="addtc" style="margin-bottom: 20px; padding: 13px; display: inline; width: 14%" class="save">
                        <button id="batc" type="button">Add Test Cases </button></div>

                    <div id="rmtc" style="margin-bottom: 20px; padding: 13px; display: inline; width: 14%" class="save">
                        <button id="brmtc" type="button">Remove Test Case </button></div>


                </div>
            </div>

            <div class="prof">

                <div class="panel">
                    <button type="submit" style="width:25%; margin-left:37%"> Post Event </button>
                </div>
            </div>

        </form>
        

        <script>

            var n=1;
            var t = 1;


            $("#batc").click(function (e) {
                var tc = document.getElementById("ntcs").value;
                var c = parseInt(tc);

                
                while (c > 1)
                {
                    n++;
                    t++;
                    $('#addtcs').show();
                    $('#rmtc').show();
                    $('#addtcs').append("<div id='addtcs" + t + "'>" +
                            "<div> Add Test Case" + n + " ::</div>"

                            + "<div style='margin-left: 14.5%; width:17%' >"
                            + "Input File:  <input type='file' name='fname' required/> </div>"
                            + "<div style='width:12%; margin-left:33%; margin-right: 58%'>"

                            + "</div>"
                            + "<div style='margin-left: 14.5%; width:17%;'>"
                            + " Output File:  <input type='file' name='fname' required/> </div> "

                            + "</div>");
                   
                    
                    c--;
                }
                c=0;
                
            });
            
            $("#brmtc").click(function () {

                $("#addtcs" + t + "").remove();
                t--;
                n--;

            });

            //        function load()
            //        {
            //
            //            var en = document.getElementById("en").value;
            //            var eon = document.getElementById("eon").value;
            //            var ed = document.getElementById("ed").value;
            //            var eda = document.getElementById("eda").value;
            //            var et = document.getElementById("et").value;
            //
            //            if (en.length === 0 || eon.length === 0 || ed.length === 0 || eda.length === 0 || et.length === 0)
            //            {
            //                document.getElementById("fill").innerHTML = "Please fill up the all details";
            //
            //            }
            //            else {
            //                var xhttp = new XMLHttpRequest();
            //                xhttp.onreadystatechange = function () {
            //                    if (this.readyState === 4 && this.status === 200) {
            //
            //                    }
            //                };
            //                var uri = encodeURIComponent(en);
            //                var uri1 = encodeURIComponent(eon);
            //                var uri2 = encodeURIComponent(ed);
            //                var uri3 = encodeURIComponent(eda);
            //                var uri4 = encodeURIComponent(et);
            //                xhttp.open("GET", "EventUpload?enn=" + uri + "&eonn=" + uri1 + "&edn=" + uri2 + "&edan=" + uri3 + "&etn=" + uri4, true);
            //                xhttp.send();
            //            }







        </script>
    </body>
</html>
