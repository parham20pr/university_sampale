<%--
  Created by IntelliJ IDEA.
  User: Reza
  Date: 4/28/2023
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>


<script>
    $(document).ready(function () {
        // Make an AJAX request to the server.
        $.ajax({
            url: "//127.0.0.1:8080/api/teacher/list",
            data: {action: 'load'},
            success: function (data) {
                // Parse the JSON data and create the HTML for the table rows.
                var rows = [];
                $.each(data, function (index, row) {
                    rows.push("<tr><td>" + row.id + "</td>" +
                        "<td>" + row.firstname + "</td>" +
                        "<td>" + row.lastname + "</td>" +
                        "<td><button class='btn  btn-danger' onclick='deleteTeacher(" + row.id + ")'>delete</button>" +
                        "<button id='buttonEdit'  class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#reg-modal' data-id='"+row.id+"' >Edit</button></td></tr>");
                });
                // Append the table rows to the table.
                $("#myTable tbody").append(rows);
                $("#myTable").dataTable(rows);
            }
        });
    });
</script>

<script>

    $(document).on('click', '#buttonEdit', function () {
        var id = $(this).data('id');
        $.ajax({
            url: '/api/teacher/edit/' + id,
            type: 'PUT',
            dataType: 'json',
            success: function (data) {

                $('#idEdit').val(data.id);
                $('#firstname').val(data.firstname);
                $('#lastname').val(data.lastname);
                $('#reg-modal').modal('show');


            },
            error: function (error) {
                console.log(error);
            }
        });
    });

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
</script>
<head>
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
            <tbody>

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




</body>
</html>
