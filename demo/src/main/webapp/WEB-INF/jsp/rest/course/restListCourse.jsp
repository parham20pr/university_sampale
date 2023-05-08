<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="true" %>
<html>
<head>
    <%@include file="liberycdn.jsp" %>></include>
    <script>

        document.addEventListener('DOMContentLoaded',function (){
            listOfCourse();
            getDataFromCourseForEdit();
            getTeacherDataForAddToCourse();
            forOpenModalToSelectTeacher();
        })
        function listOfCourse(){
            $.ajax({
                url: "//127.0.0.1:8081/api/course/list",
                // data:{action:'load'},
                success: function (data) {
                    // Parse the JSON data and create the HTML for the table rows.
                    $("#listCourseTemplate").tmpl(data).appendTo("#listCourse");
                    // Append the table rows to the table.
                    $("#myTable").dataTable();
                }
            });
        }

        function getDataFromCourseForEdit(){
            $(document).on('click', '#buttonEdit', function () {
                var id = $(this).data('id');
                $.ajax({
                    url: '/api/course/edit/' + id,
                    type: 'PUT',
                    dataType: 'json',
                    success: function (data) {

                        $('#title').val(data.title);
                        $('#idEdit').val(data.id);
                        $('#unit').val(data.unit);
                        $('#eventplace').val(data.eventplace);
                        $('#reg-modal').modal('show');


                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });
        }

        function saveChanges() {
            var id = $('#idEdit').val();
            var title = $('#title').val();
            var unit = $('#unit').val();
            var eventplace = $('#eventplace').val();

            if (!title || !unit || !eventplace) {
                alert('Please fill in all fields!');
                return;
            }

            $.ajax({
                url: '/api/course/save' ,
                type: 'POST',
                contentType:"application/json",
                data: JSON.stringify({
                    id:id,
                    title: title,
                    unit: unit,
                    eventplace: eventplace
                }) ,
                success: function () {
                    alert('Changes saved successfully!');
                }
            });
        }

        function forOpenModalToSelectTeacher(){
            $(document).on('click' , '#buttonForAddTeacher' , function (){
                var id = $(this).data('id');
                $.ajax({
                    url: '/api/course/edit/' +id,
                    type: 'PUT',
                    success: function (data){
                        $('#idCourses').val(data.id);
                        debugger;
                    },
                    error:function (error){
                        console.log(error);
                    }
                });
            });

        }

        var TeacherData={};
        function getTeacherDataForAddToCourse(){
            $(document).on('click', '#teacher-select', function () {
                $.ajax({
                    url: "/api/teacher/list",
                    type: "GET",
                    typedata: 'JSON',
                    success: function (teacher) {
                        for (var i = 0; i < teacher.length; i++) {
                            var option = $('<option></option>').attr("value", teacher[i].id).text(teacher[i].firstname+"  "+teacher[i].lastname);
                            $('#teacher-select').append(option);
                        }
                        $('#teacher-select').change(function() {
                            TeacherData = {
                                Teacherid:$(this).val(),
                                TeacherFirstname: $(this).find(":selected").text(),
                                TeacherLastname: $(this).find(":selected").text()
                            };
                            console.log(CoursesData)
                        });
                    }
                });
            })
        }

        function saveTeacherForCourse(){
            var idCourses = $('#idCourses').val();
            var idTeacher = TeacherData.Teacherid;
            debugger
            $.ajax({
                url:"/api/course/updateteacher/"+idTeacher+"/"+idCourses,
                type:'POST',
                contentType: "application/json",
                success:function (){
                    alert('Changes saved successfully!')
                    window.location.reload();
                },error:function (error){
                    console.log(error);
                }
            })
        }

        function deleteCourses(id) {
            $.ajax({

                    url: "/api/course/delete/" + id,
                    type: "delete",
                    method: "delete",
                    success: function () {
                        window.location.reload();
                    }

                }
            )
        }

        function pagination (){
            $('#myTable ').dataTable()
        }


    </script>
    <title>list courses</title>
</head>
<body>



<div class=" col-lg-9 mx-auto">
    <div class="form-group form-group-lg">
        <table class="table table-striped" id="myTable">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Title</th>
                    <th>unit</th>
                    <th>eventplace</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="listCourse">
                <script id="listCourseTemplate" type="text/template">
                    <tr>
                        <td>${id}</td>
                        <td>${title}</td>
                        <td>${unit}</td>
                        <td>${eventplace}</td>
                        <td>
                            <button class="btn  btn-danger" onclick="deleteCourses(${id})">delete</button>
                            <button id="buttonEdit" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#reg-modal" data-id="${id}">Edit</button>
                            <button id='buttonForAddTeacher' class='btn btn-success' data-bs-toggle='modal' data-bs-target='#addTeacher-modal' data-id='${id}'>Add Teacher</button>
                        </td>
                    </tr>
                </script>
            </tbody>
        </table>
        <button type="submit" id="buttonadd" class="btn btn-outline-warning"
                onclick="window.location.href='/course/add'">Add Course</button>
        <button type="button" id="back to home" class="btn btn-outline-success"
                onclick="location.href='/'">Home</button>
    </div>
</div>


<div class="modal fade" id="reg-modal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="mb-3">
                        <input type="hidden" class="form-control" id="idEdit" placeholder="Enter university name">
                    </div>

                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" placeholder="Enter Title" maxlength="50" minlength="3">
                    </div>
                    <div class="mb-3">
                        <label for="unit" class="form-label">unit</label>
                        <input type="text" class="form-control" id="unit" placeholder="Enter unit" maxlength="50" minlength="3">
                    </div>
                    <div class="mb-3">
                        <label for="eventplace" class="form-label">Mhalebarbozari</label>
                        <input type="text" class="form-control" id="eventplace" placeholder="Enter Mhalebarbozari" maxlength="50" minlength="3">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" onclick="saveChanges()" id="idEdit">Save changes</button>
            </div>
        </div>
    </div>
</div>



<%--modal for add teacher--%>

<div class="modal fade" id="addTeacher-modal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Add Teacher to Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="mb-3">
                        <input type="hidden" class="form-control" id="idCourses"  >
                    </div>

                    <div class="dropdown" >
                        <label> Add Teacher</label>
                        <select class="dropdown" id="teacher-select" >
                            <option ></option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" onclick="saveTeacherForCourse()" id="saveTeacherForCourse">Save changes</button>
            </div>
        </div>
    </div>
</div>



</body>
</html>
