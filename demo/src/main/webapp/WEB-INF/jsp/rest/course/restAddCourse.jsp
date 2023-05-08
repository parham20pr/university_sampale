<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <%@include file="liberycdn.jsp" %>></include>

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
                        // do something on success
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
                            class="btn btn-primary btn-lg" >Save
                    </button>
                </div>
            </div>
        </form>
        <button onclick="location.href='/course/list'" class="btn btn-outline-danger  btn-lg">Go Back To List</button>

    </div>

</body>
</html>
