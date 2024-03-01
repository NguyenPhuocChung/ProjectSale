<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h2, h3, h4 {
            color: #007bff;
        }

       

       
        .form-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }

        .popup {
            display: none;
            position: fixed;
            z-index: 999;
            background-color: rgba(0, 0, 0, 0.5);
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .popup-content {
            background-color: white;
            padding: 20px;
            width: 300px; /* Width of the popup */
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .close {
            position: absolute;
            top: 5px;
            right: 10px;
            cursor: pointer;
        }

        .form-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            border: 1px solid #000000;
            padding: 20px;
            display: none;
        }

        /* Button styles */
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Input styles */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        /* Form button styles */
        .form-container button[type="submit"] {
            background-color: #28a745;
        }

        .form-container button[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-primary">Hello!!!!</h2>
    <div class="d-flex">
        <h3 style="display: flex; gap: 10px" class="text-success">Chào mừng  <p class="text-secondary"> Minh </p>đến với CanthoTour</h3>
    </div>
    <hr>
    <div class="mt-4">
        <h4>Thông tin cá nhân</h4>
        <div class="row">
            <div class="col-md-6">
                <p><strong>Họ và tên:</strong> <%= "Minh"%></p>
                <p><strong>Điểm thưởng:</strong> <%= 100%></p>
                <p><strong>Số tour đã đi:</strong> <%= 5%></p>
            </div>
            <div class="col-md-6">
                <p><strong>Email:</strong> <%= "user@example.com"%></p>
                <p><strong>Số điện thoại:</strong> <%= "123456789"%></p>
                <p><strong>Địa chỉ:</strong> <%= "123 Đường ABC"%></p>
            </div>
        </div>
    </div>
    <hr>
    <div class="mt-4">
        <button id="openPopup">Thay đổi mật khẩu</button>

        <div id="popup" class="popup">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="button">Thay đổi mật khẩu</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="changePasswordForm" action="ChangePasswordController" method="post">
                            <div class="form-group">
                                <label for="oldPassword">Mật khẩu cũ:</label>
                                <input type="password" class="form-control" name="oldPassword" id="oldPassword" required>
                            </div>
                            <div class="form-group">
                                <label for="newPassword">Mật khẩu mới:</label>
                                <input type="password" class="form-control" name="newPassword" id="newPassword" required>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Xác nhận mật khẩu mới:</label>
                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4"></div> <!-- Khoảng trống ở đây -->

    <button onclick="openEditForm()">Chỉnh sửa thông tin cá nhân</button>

    <div id="editForm" class="form-container">
        <h4>Chỉnh sửa thông tin cá nhân</h4>
        <button type="button" class="close" id="editClose" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <form action="EditProfileController" method="post">
            <div class="form-group">
                <label for="newFullName">Họ và tên mới:</label>
                <input type="text" class="form-control" name="newFullName" value="Minh" required>
            </div>
            <div class="form-group">
                <label for="newPhone">Số điện thoại mới:</label>
                <input type="text" class="form-control" name="newPhone" value="123456789" required>
            </div>
            <div class="form-group">
                <label for="newAddress">Địa chỉ mới:</label>
                <input type="text" class="form-control" name="newAddress" value="123 Đường ABC" required>
            </div>
            <button type="submit" class="btn btn-success">Chỉnh sửa thông tin</button>
        </form>
    </div>
</div>

<script>
    document.getElementById("changePasswordForm").addEventListener("submit", function (event) {
        var oldPassword = document.getElementById("oldPassword").value;
        var newPassword = document.getElementById("newPassword").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        // Kiểm tra xem mật khẩu cũ đã nhập có đúng không
        if (oldPassword !== "mật khẩu cũ") {
            alert("Mật khẩu cũ không chính xác. Vui lòng nhập lại.");
            event.preventDefault(); // Ngăn chặn việc submit form
        }

        // Kiểm tra xác nhận mật khẩu mới
        if (newPassword !== confirmPassword) {
            alert("Mật khẩu mới và xác nhận mật khẩu mới không khớp. Vui lòng nhập lại.");
            event.preventDefault(); // Ngăn chặn việc submit form
        }
    });
</script>


<script>
    var button = document.getElementById("button");
    var content = document.getElementById("content");
    button.addEventListener('click', function () {
        if (content.style.display === 'none') {
            content.style.display = 'block';
        } else {
            content.style.display = 'none';
        }
    });

    var button1 = document.getElementById("button1");
    var content1 = document.getElementById("content1");
    button1.addEventListener('click', function () {
        if (content1.style.display === 'none') {
            content1.style.display = 'block';
        } else {
            content1.style.display = 'none';
        }
    });
</script>



<script>
    function openEditForm() {
        var editForm = document.getElementById("editForm");
        editForm.style.display = "block";
    }

    document.addEventListener("DOMContentLoaded", function () {
        var editCloseButton = document.getElementById("editClose");
        editCloseButton.addEventListener("click", function () {
            var editForm = document.getElementById("editForm");
            editForm.style.display = "none";
        });
    });
</script>

<script>
    document.getElementById('openPopup').addEventListener('click', function () {
        document.getElementById('popup').style.display = 'block';
    });

    document.querySelector('.close').addEventListener('click', function () {
        document.getElementById('popup').style.display = 'none';
    });

</script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    var editCloseButton = document.getElementById("editClose");
    var editForm = document.getElementById("editForm");

    editCloseButton.addEventListener("click", function () {
        editForm.style.display = "none";
    });
});
</script>
</body>
</html>
