<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="liberycdn.jsp" %>></include>
    <script>

        $(document).ready(function () {
            addCourse();
        });

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

    </script>
    <title>Add University</title>
</head>
<body>

    <div class="container col-lg-12" >

    <div class="col-lg-12">

        <form class="form-horizontal" id="myTableInput">

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
                            class="btn btn-primary btn-lg" >Save
                    </button>
                </div>
            </div>
        </form>
        <button onclick="location.href='/university/list'" class="btn btn-outline-danger  btn-lg">Go Back To List</button>
    </div>


</body>
</html>
