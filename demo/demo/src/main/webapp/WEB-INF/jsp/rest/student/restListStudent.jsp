<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ page isELIgnored="true" %>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<head>
    <%@include file="liberycdn.jsp" %>></include>
    <script>

        document.addEventListener('DOMContentLoaded',function (){
            listOfStudent();
            getDataFormStudentForEdit();
            getDataFromUniversityForEditStudent();
            getDataFromCourseForAddToStudent();
            getDataFromCourseForEdit;
        })

        var student = null;

        function listOfStudent(){
            // Make an AJAX request to the server.
            $.ajax({
                url: "//127.0.0.1:8081/api/student/list",
                data:{action:'load'},
                success: function (data) {
                    // Parse the JSON data and create the HTML for the table rows.
                    $("#listStudentTemplate").tmpl(data).appendTo("#listStudent");
                    // Append the table rows to the table.
                    $("#myTable").dataTable();
                }
            });
        }

        function getDataFormStudentForEdit(){
            $(document).on('click' , '#buttonEdit' , function (){
                var id = $(this).data('id');
                $.ajax({
                    url: '/api/student/edit/' +id,
                    type: 'PUT',
                    success: function (data){

                        $('#firstname').val(data.firstname);
                        $('#idEdit').val(data.id);
                        $('#lastname').val(data.lastname);
                        $('#university').val(data.university.nameuniversity)
                        $('#universityEdit').val(data.university.id)
                        $('#reg-modal').modal('show')
                        debugger;
                    },
                    error:function (error){
                        console.log(error);
                    }
                });

            });
        }


        function saveChanges(){
            var id = $('#idEdit').val();
            var firstname = $('#firstname').val();
            var lastname = $('#lastname').val();
            var university = universityData.universityName
            var universiyId = universityData.unid
            debugger;
            $.ajax({
                url: '/api/student/save',
                type: 'POST',
                contentType:"application/json",
                data: JSON.stringify({
                    id:id,
                    firstname: firstname,
                    lastname: lastname,
                    university: {
                        id: universiyId,
                        name: university,
                    }
                }),
                success: function (data) {
                    alert('Changes saved successfully!');
                    window.location.reload();
                },
                error: function (error) {
                    console.log(error);
                }

            })
        }

        var universityData = {};
        function getDataFromUniversityForEditStudent(){
            $(document).on('click', '#university-select', function () {
                $.ajax({
                    url: "/api/university/list",
                    type: "GET",
                    typedata: 'JSON',
                    success: function (university) {
                        for (var i = 0; i < university.length; i++) {
                            $("#myDropdown option").remove();
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
        }


        // Add Course
        var CoursesData={};
        function getDataFromCourseForAddToStudent(){
            $(document).on('click', '#courses-select', function () {
                $.ajax({
                    url: "/api/course/list",
                    type: "GET",
                    typedata: 'JSON',
                    success: function (courses) {
                        for (var i = 0; i < courses.length; i++) {
                            var option = $('<option></option>').attr("value", courses[i].id).text(courses[i].title+"---->"+courses[i].eventplace);
                            $('#courses-select').append(option);

                        }
                        $('#courses-select').change(function() {
                            CoursesData = {
                                coursesTitle: $(this).find(":selected").text(),
                                Coursesid: $(this).val()
                            };
                            console.log(CoursesData)
                        });

                    }
                });
            })
        }

        function saveChangesCourse(){
            var idstudent = $('#idAdd').val();
            var idcourse = CoursesData.Coursesid
            debugger;
            $.ajax({
                url: '/api/student/addcourse/'+idstudent+'/'+idcourse,
                type: 'get',
                contentType:"application/json",
                success: function (data) {
                    alert('Changes saved successfully!');
                    window.location.reload();
                },
                error: function (error) {
                    console.log(error);
                }

            })


        }

        function getDataFromCourseForEdit(){
            $(document).on('click' , '#addCourse' , function (){
                var id = $(this).data('id');
                $.ajax({
                    url: '/api/student/edit/' +id,
                    type: 'PUT',
                    success: function (data){
                        $('#idAdd').val(data.id);
                        $('#idAddUni').val(data.university.id);
                        debugger;
                    },
                    error:function (error){
                        console.log(error);
                    }
                });

            });
        }


        function deleteCourses(id) {
            $.ajax({

                    url: "/api/student/delete/" + id,
                    type: "delete",
                    method: "delete",
                    success: function () {
                        window.location.reload();
                    }

                }
            )
        }

        function loadDataFromStudentAndCourses(studentId) {
            student = studentId
            debugger
            $.ajax({
                url: "/api/student/showdetail/" + studentId,
                type: "GET",
                method: "GET",
                cache: false,
                contentType: "application/json",
                success: function (data) {
                    // Parse the JSON data and create the HTML for the table rows.
                    $("#listCourseTemplate").tmpl(data).appendTo("#listCourse");
                    // Append the table rows to the table.
                    $("#loadDataFromStudentId").dataTable();
                    $('#LoadDataCourse-modal').on('hidden.bs.modal', function () {
                        location.reload();
                    });
                }
            })
        }

        function deleteCourseByIdStudent(idCourse){
            var mystudentid=student;
            debugger
            $.ajax({
                url:"/api/student/deletecourse/"+mystudentid+"/"+idCourse,
                type:"DELETE",
                method: "DELETE",
                success: function () {
                    window.location.reload();
                }
            })
        }

        $('#courses-select').on('hide', function() {
            window.location.reload();
        });


    </script>
    <title>List Student</title>
</head>
<body>

<div class=" col-lg-9 mx-auto" >
    <div class="form-group form-group-lg" >
        <table class="table table-striped mx-auto" id="myTable">
            <thead>
                <tr>
                    <th>id</th>
                    <th>firstname</th>
                    <th>lastname</th>
                    <th>university</th>
                    <th>Courses</th>
                </tr>
            </thead>
            <tbody id="listStudent">
                <script id="listStudentTemplate" type="text/template">
                    <tr>
                        <td>${id}</td>
                        <td>${firstname}</td>
                        <td>${lastname}</td>
                        <td>${university.name}</td>
                        <td>
                            <button class='btn  btn-danger' onclick='deleteCourses("${id}")'>delete</button>
                            <button id='buttonEdit'  class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#reg-modal' data-id='${id}' >Edit</button>
                            <button id='Data-modal' class='btn btn-info' data-bs-toggle='modal' data-bs-target='#LoadDataCourse-modal' onclick='loadDataFromStudentAndCourses("${id}")'>Viwe Course</button>
                            <button class='btn btn-dark btn-rounded' id='addCourse' data-bs-toggle='modal' data-bs-target='#addCurse-modal'  data-id='${id}'>Add Course</button>
                        </td>
                    </tr>
                </script>

            </tbody>
        </table>
        <button type="submit" id="buttonadd" class="btn btn-outline-warning"
                onclick="window.location.href='/student/add'">Add Student</button>
        <button type="button" id="back to home" class="btn btn-outline-success"
                onclick="location.href='/'">Home</button>
    </div>
</div>

<%--modal for editStudent--%>
<div class="modal fade" id="reg-modal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Student</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="mb-3">
                        <input type="hidden" class="form-control" id="idEdit" placeholder="Enter university name">
                    </div>

                    <div class="mb-3">
                        <label for="firstname" class="form-label">FristName</label>
                        <input type="text" class="form-control" id="firstname" placeholder="Enter firstname">
                    </div>
                    <div class="mb-3">
                        <label for="lastname" class="form-label">LastName</label>
                        <input type="text" class="form-control" id="lastname" placeholder="Enter LastName">
                    </div>


                    <div class="dropdown">
                        <label> Name University</label>
                    <select class="dropdown" id="university-select">
                        <option ></option>
                    </select>


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



<%--modal for load data from studentId and Curse--%>
<div class="modal right fade" id="LoadDataCourse-modal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl  modal-top-right">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loadModalLabel">Load data from StudentId</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="mb-3">
                    <input type="hidden" class="form-control" id="idStudent">
                </div>
                <table class="table table-striped" id="loadDataFromStudentId">
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
                                <button class='btn  btn-danger' onclick='deleteCourseByIdStudent("${id}")'>delete
                                </button>
                            </td>
                        </tr>
                    </script>

                    </tbody>
                </table>
            </div>

            <div class="modal-footer">
                <button id="closeModalViwe" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                </button>
                <button type="submit" class="btn btn-primary" onclick="saveChanges()" id="idloadDataCourse">Save
                    changes
                </button>
            </div>
        </div>
    </div>
</div>

<%--modal for addCourse--%>

<div class="modal fade" id="addCurse-modal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCourseModalLabel">Add Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="mb-3">
                        <input type="hidden" class="form-control" id="idAdd">
                    </div>

                    <div class="mb-3">
                        <input type="hidden" class="form-control" id="idAddUni">
                    </div>


                    <div class="dropdown">
                        <label> Add Course</label>
                        <select class="dropdown" id="courses-select"  >
                            <option ></option>
                        </select>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" onclick="saveChangesCourse()" id="idAdd">Save changes</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
