<%-- 
    Document   : register
    Created on : Oct 9, 2023, 9:28:46 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <!-- Include Bootstrap CSS library -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom CSS -->
        <link rel="stylesheet" href="styles.css">
    </head>
    <body style="background-image: url('your-background-image.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center center;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="text-center">Registration</h3>
                        </div>
                        <div class="card-body">
                            <form method="post" action="CustomerController" class="needs-validation was-validated">
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input name="email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone Number:</label>
                                    <input name="numberPhone" type="text" class="form-control" id="phone" placeholder="Enter your phone number" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword">Confirm Password:</label>
                                    <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm your password" required>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username:</label>
                                    <input name="username" type="text" class="form-control" id="username" placeholder="Enter your username" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <input name="address" type="text" class="form-control" id="address" placeholder="Enter your address" required>
                                </div>
                                <button name="btnsubmit1" type="submit" class="btn btn-primary btn-block">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    var form = document.querySelector('.needs-validation');
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        } else {
                            var password = document.getElementById('password').value;
                            var confirmPassword = document.getElementById('confirmPassword').value;

                            if (password !== confirmPassword) {
                                event.preventDefault();
                                event.stopPropagation();
                                alert("Passwords do not match. Please try again.");
                            }
                        }
                    }, false);
                });
            })();
        </script>



        <!-- Include Bootstrap JS and Popper.js (if needed) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
