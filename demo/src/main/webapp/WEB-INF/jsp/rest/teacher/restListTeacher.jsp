<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="true" %>

<html>

<head>
    <%@include file="liberycdn.jsp" %>></include>
    <script>

        document.addEventListener('DOMContentLoaded', function() {
            listOfTeacher();
            getDataForEdit();
        });

        function listOfTeacher(){
            $.ajax({
                url: "//127.0.0.1:8081/api/teacher/list",
                dataType: "json",
                data: {action: 'load'},
                success: function (data) {
                    $("#teacherTemplate").tmpl(data).appendTo("#teacher");

                    // Append the table rows to the table.
                    $("#myTable").dataTable();
                }
            });
        }

        function getDataForEdit() {
            $(document).on('click', '#buttonEdit', function() {
                var id = $(this).data('id');
                $.ajax({
                    url: '/api/teacher/edit/' + id,
                    type: 'PUT',
                    dataType: 'json',
                    success: function(data) {
                        $('#idEdit').val(data.id);
                        $('#firstname').val(data.firstname);
                        $('#lastname').val(data.lastname);
                        $('#reg-modal').modal('show');
                    },
                    error: function(error) {
                        console.log(error);
                    }
                });
            });
        }

        function saveChanges(){
            var id = $('#idEdit').val();
            var firstname = $('#firstname').val();
            var lastname = $('#lastname').val();

            if (!firstname || !lastname){
                alert("Please fill in all fields!")
                return;
            }
            $.ajax({
                url:'/api/teacher/save',
                type:'POST',
                contentType:'application/json',
                data: JSON.stringify({
                    id:id,
                    firstname:firstname,
                    lastname:lastname
                }),
                success:function (){
                    alert('Changes saved successfully!')
                }
            })
        }

        function deleteTeacher(id){
            $.ajax({
                url: "/api/teacher/delete/"+id,
                type: "delete",
                method:"delete",
                success :function (){
                    window.location.reload()
                }
            })
        }

        function getShowCourseToTeacher(teacherId){

                $.ajax({
                    url:"/api/course/showcoursetoteacher/"+teacherId,
                    type:"GET",
                    contentType: "application/json",
                    success:function (data){
                        $("#listCourseTemplate").tmpl(data).appendTo("#listCourse");
                        $("#showCourseToTeacherTable").dataTable();
                        $("#showCourseToTeacher-modal").on('hidden.bs.modal',function (){
                            location.reload();
                        })
                    }
                })
            }

        function deleteTeacherFormCourse(courseId){
            $.ajax({
                url:"/api/course/deleteteacheridincourse/"+courseId,
                type:"DELETE",
                method: "DELETE",
                success:function (){
                    window.location.reload();
                }

            })

        }
    </script>
    <title>Teacher List</title>
</head>
<body>




<div class=" col-lg-9 mx-auto">
    <div class="form-group form-group-lg">
        <table class="table table-striped" id="myTable">
            <thead>
            <tr>
                <th>id</th>
                <th>FrisName</th>
                <th>LastName</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="teacher">
            <script id="teacherTemplate" type="text/template">
                <tr>
                    <td>${id}</td>
                    <td>${firstname}</td>
                    <td>${lastname}</td>
                    <td>
                        <button class="btn btn-danger" onclick="deleteTeacher(${id})">Delete</button>
                        <button id="buttonEdit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reg-modal" data-id="${id}">Edit</button>
                        <button id="showCourseToTeacher" class="btn btn-success"  data-bs-toggle="modal" data-bs-target="#showCourseToTeacher-modal" onclick="getShowCourseToTeacher(${id})">Show Course</button>
                    </td>
                </tr>
            </script>
            </tbody>
        </table>
        <%--        <button type="submit" id="buttonlist">Call List</button>--%>
        <button type="submit" id="buttonadd" class="btn btn-outline-warning"
                onclick="window.location.href='/teacher/add'">Add Teacher</button>
        <button type="button" id="back to home" class="btn btn-outline-success"
                onclick="location.href='/'">Home</button>
    </div>

</div>

    <%--<<<<modal for edite>>>>>>>>>--%>
    <div class="modal fade" id="reg-modal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Teacher</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>

                        <div class="mb-3">
                            <input type="hidden" class="form-control" id="idEdit" placeholder="Enter university name">
                        </div>

                        <div class="mb-3">
                            <label for="firstname" class="form-label">FirstName</label>
                            <input type="text" class="form-control" id="firstname" placeholder="Enter firstname" maxlength="50" minlength="3">
                        </div>
                        <div class="mb-3">
                            <label for="lastname" class="form-label">LastName</label>
                            <input type="text" class="form-control" id="lastname" placeholder="Enter lastname" maxlength="50" minlength="3">
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




    <%--<<<<modal for Show Course To Teacher>>>>>>>>>--%>
    <div class="modal right fade" id="showCourseToTeacher-modal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl  modal-top-right">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="showCourseToTeacherModalLabel">Show Course</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table table-striped" id="showCourseToTeacherTable">
                        <thead>
                            <tr>
                                <td>id</td>
                                <td>Title</td>
                                <td>unit</td>
                                <td>eventplace</td>
                                <td>Action</td>
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
                                        <button class="btn btn-danger" id="deleteCourseFromTeacher" onclick="deleteTeacherFormCourse(${id})">delete</button>
                                    </td>
                                </tr>
                            </script>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
