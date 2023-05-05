<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Reza
  Date: 4/11/2023
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous"></script>

<script>

    var universityData = {};

    $(document).on('click', '#university-select', function () {
        $.ajax({
            url: "/api/university/list",
            type: "GET",
            typedata: 'JSON',
            success: function (university) {
                for (var i = 0; i < university.length; i++) {
                    var option = $('<option></option>').attr("value", university[i].id).text(university[i].name);
                    $('#university-select').append(option);
                }
                $('#university-select').change(function() {
                    universityData = {
                        universityName: $(this).find(":selected").text(),
                        unid: $(this).val()
                    };
                    console.log(universityData)
                });
            }
        });
    })


    function addCourse() {
        $("#myTableInput").submit(function (event) {
            event.preventDefault();

            var fristname = $("#fristname").val();
            var lastname = $("#lastname").val();
            var universityName = universityData.universityName
            var univ = universityData.unid

            var entity = {
                'firstname': fristname,
                'lastname': lastname,
                'university': {
                    'name': universityName,
                    'id': univ
                }
            }
            debugger
            $.ajax({
                url: "/api/student/add",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(entity),

                success: function () {
                    debugger;
                    // do something on success
                    // window.location.reload();
                    alert("ok shod")
                    window.location.reload();


                },
                error: function () {
                    debugger
                }
            });
        });
    }


    $(document).ready(function () {
        addCourse();
    });


</script>

<head>
    <title>Add Student</title>
</head>
<body>
<div class="container col-lg-12 max-auto">

    <div class="col-lg-12 max-auto">

        <form class="form-horizontal" id="myTableInput">

            <%--            <div id ="myTableInput"></div>--%>

            <h4>Add Student</h4>
            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">fristname :</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="fristname" name="fristname"/>
                </div>
            </div>

            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">lastname :</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="lastname" name="lastname"/>
                </div>
            </div>


                <div class="dropdown">
                    <label> Name University</label>
                <select class="dropdown" id="university-select">
                    <option></option>
                </select>
            </div>


            <%--            <div class="form-group form-group-lg">--%>
            <%--                <label class="col-sm-4 control-label">university :</label>--%>
            <%--                <div class="col-sm-4">--%>
            <%--                    <input type="text" class="form-control" id="university.nameuniversity" name="university"/>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-12">
                    <button type="submit" id="saveCourse"
                            class="btn btn-primary btn-lg">Submit
                    </button>
                </div>
            </div>
        </form>
        <button onclick="location.href='/student/list'" class="btn btn-outline-danger  btn-lg">Go Back To List</button>
    </div>


</body>
</html>
