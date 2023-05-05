<%--
  Created by IntelliJ IDEA.
  User: Reza
  Date: 4/11/2023
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous"></script>

<script>
    function addCourse() {
        $(document).on("submit", "#myTableInput", function(event) {
            event.preventDefault();

            var title = $("#title").val();
            var unit = $("#unit").val();
            var eventplace = $("#eventplace").val();

            var entity = {
                'title': title,
                'unit': unit,
                'eventplace': eventplace
            }
            $.ajax({
                url: "/api/course/add",
                type: "POST",
                contentType:"application/json ",
                Accept: "application/json",
                data:JSON.stringify(entity),

                success: function (data) {
                    // debugger;
                    // // do something on success
                    alert("ok shod")
                    window.location.reload();
                    // alert("ok shod")
                    console.log(data);


                }
            });
        });
    }

    $(document).ready(function () {
        addCourse();
    });


</script>
<head>
    <title>Add Course</title>
</head>
<body>

<div class="container col-lg-12 max-auto"  >

    <div class="col-lg-12">

        <form class="form-horizontal" id="myTableInput">


            <h4>Add Course</h4>
            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">title :</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="title" name="title"  maxlength="50" minlength="3" />
                </div>
            </div>

            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">unit</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="unit" name="unit" maxlength="50" minlength="1"/>
                </div>
            </div>

            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">Event Place</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="eventplace" name="eventplace" maxlength="50" minlength="3"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-12">
                    <button type="submit" id="saveCourse"
                            class="btn btn-primary btn-lg" >Submit
                    </button>
                </div>
            </div>
        </form>
        <button onclick="location.href='/course/list'" class="btn btn-outline-danger  btn-lg">Go Back To List</button>

    </div>

</body>
</html>
