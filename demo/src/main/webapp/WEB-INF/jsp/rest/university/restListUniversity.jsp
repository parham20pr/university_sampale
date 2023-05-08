<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="true" %>
<html>

<head>
    <%@include file="liberycdn.jsp" %>></include>
    <script>
        document.addEventListener('DOMContentLoaded',function (){
            listOfUniversity();
            getDataForEditUniversity();
        })

        function listOfUniversity(){
            $.ajax({
                url: "//127.0.0.1:8081/api/university/list",
                data: {action: 'load'},
                success: function (data) {
                    // Parse the JSON data and create the HTML for the table rows.
                    $("#listUniversityTemplate").tmpl(data).appendTo("#listUniversity");
                    // Append the table rows to the table.
                    $("#myTable").dataTable();
                }
            });
        }

        function getDataForEditUniversity() {
            $(document).on('click', '#buttonEdit', function () {
                var id = $(this).data('id');
                $.ajax({
                    url: '/api/university/edit/' + id,
                    type: 'PUT',
                    dataType: 'json',
                    success: function (data) {

                        $('#name').val(data.name);
                        $('#idEdit').val(data.id);
                        $('#state').val(data.state);
                        $('#city').val(data.city);
                        $('#reg-modal').modal('show');


                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });
        }

        function saveChanges() {

            var id = $("#idEdit").val();
            var name = $('#name').val();
            var state = $('#state').val();
            var city = $('#city').val();

            if (!name || !state || !city) {
                alert('Please fill in all fields!');
                return;
            }

            $.ajax({
                url: '/api/university/save',
                type: 'POST',
                contentType: "application/json",
                data: JSON.stringify({
                    id: id,
                    name: name,
                    state: state,
                    city: city
                }),
                success: function (data) {
                    alert('Changes saved successfully!');
                    window.location.reload();
                }
            });
        }

        function deleteCourses(id) {
            $.ajax({

                    url: "/api/university/delete/" + id,
                    type: "delete",
                    method: "delete",
                    success: function () {
                        alert("ok shod")
                        window.location.reload();
                    }

                }
            )
        }

    </script>
    <title>List University</title>
</head>
<body>


<div class=" col-lg-9 mx-auto">
    <div class="form-group form-group-lg">
        <table class="table table-striped" id="myTable">
            <thead>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>state</th>
                <th>city</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="listUniversity">
                <script id="listUniversityTemplate" type="text/template">
                    <tr>
                        <td>${id}</td>
                        <td>${name}</td>
                        <td>${state}</td>
                        <td>${city}</td>
                        <td>
                            <button class='btn  btn-danger' onclick='deleteCourses("${id}")'>delete</button>
                            <button id='buttonEdit' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#reg-modal' data-id='${id}'>Edit</button>
                        </td>
                    </tr>
                </script>

            </tbody>
        </table>
        <%--        <button type="submit" id="buttonlist">Call List</button>--%>
        <button type="submit" id="buttonadd" class="btn btn-outline-warning"
                onclick="window.location.href='/university/add'">Add University</button>
        <button type="button" id="back to home" class="btn btn-outline-success"
                onclick="location.href='/'">Home</button>
    </div>

</div>

<%-->>>> modal--%>

<div class="modal fade" id="reg-modal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit University</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="mb-3">
                        <input type="hidden" class="form-control" id="idEdit" placeholder="Enter university name">
                    </div>

                    <div class="mb-3">
                        <label for="name" class="form-label">University Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter university name">
                    </div>
                    <div class="mb-3">
                        <label for="state" class="form-label">State</label>
                        <input type="text" class="form-control" id="state" placeholder="Enter state name">
                    </div>
                    <div class="mb-3">
                        <label for="city" class="form-label">City</label>
                        <input type="text" class="form-control" id="city" placeholder="Enter city name">
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
