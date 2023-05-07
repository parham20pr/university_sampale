<%--
  Created by IntelliJ IDEA.
  User: Reza
  Date: 4/24/2023
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous"></script>
<head>
    <title>index</title>
</head>
<body>
    <div class="row">
        <div class="col-lg-12  text-center ">
            <div class="my-2">
                <button onclick="location.href='/course/list'" class="btn btn-outline-danger btn-lg">course list</button>
            </div>
            <div class="my-2">
                <button onclick="location.href='/teacher/list'" class="btn btn-outline-danger btn-lg">teacher list</button>
            </div>
            <div class="my-2">
                <button onclick="location.href='/student/list'" class="btn btn-outline-danger btn-lg">students list</button>
            </div>
            <div class="my-2">
                <button onclick="location.href='/university/list'" class="btn btn-outline-danger btn-lg">universites list</button>
            </div>
        </div>
    </div>

</body>

</html>
