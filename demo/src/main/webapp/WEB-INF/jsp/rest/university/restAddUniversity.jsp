<%--
  Created by IntelliJ IDEA.
  User: Reza
  Date: 4/11/2023
  Time: 3:15 PM
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
        $("#myTableInput").submit(function (event) {
            event.preventDefault();

            var name = $("#name").val();
            var state = $("#state").val();
            var city = $("#city").val();

            var entity = {
                'name': name,
                'state': state,
                'city': city
            }
            $.ajax({
                url: "/api/university/add",
                type: "POST",
                contentType:"application/json",
                data:JSON.stringify( entity),
                success: function () {
                    debugger;
                    alert("ok shod")
                     window.location.reload();



                }
            });
        });
    }

    $(document).ready(function () {
        addCourse();
    });

    // function relod (){
    //     $("#saveCourse").click(){
    //         window.location.reload();
    //     }
    // }


</script>

<head>
    <title>Add University</title>
</head>
<body>

<div class="container col-lg-12" >

    <div class="col-lg-12">

        <form class="form-horizontal" id="myTableInput">

            <%--            <div id ="myTableInput"></div>--%>

            <h4>Add University</h4>
            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">nameuniversity :</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="name" name="name"/>
                </div>
            </div>

            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">state </label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="state" name="state"/>
                </div>
            </div>

            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">city :</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="city" name="city"/>
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
        <button onclick="location.href='/university/list'" class="btn btn-outline-danger  btn-lg">Go Back To List</button>

    </div>




</body>
</html>
