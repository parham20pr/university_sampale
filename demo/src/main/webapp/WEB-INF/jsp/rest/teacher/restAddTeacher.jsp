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

                var firstname = $("#firstname").val();
                var lastname = $("#lastname").val();


                var entity = {
                    'firstname': firstname,
                    'lastname': lastname
                }
                $.ajax({
                    url: "/api/teacher/add",
                    type: "POST",
                    contentType:"application/json",
                    data:JSON.stringify(entity),
                    success: function () {
                        debugger;
                        alert("ok shod")
                        window.location.reload();



                    }
                });
            });
        }
    </script>
    <title>Add Teacher</title>
</head>

<body>

    <div class="container col-lg-12" >

    <div class="col-lg-12">

        <form class="form-horizontal" id="myTableInput">


            <h4>Add Teachers</h4>
            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">FristName</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="firstname" name="firstname"/>
                </div>
            </div>

            <div class="form-group form-group-lg">
                <label class="col-sm-4 control-label">LastName</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="lastname" name="lastname"/>
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-12">
                    <button type="submit" id="saveTeacher"
                            class="btn btn-primary btn-lg" >Save
                    </button>
                </div>
            </div>
        </form>
        <button onclick="location.href='/teacher/list'" class="btn btn-outline-danger  btn-lg">Go Back To List</button>

    </div>
    </div>
</body>
</html>
