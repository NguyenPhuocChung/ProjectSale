<%-- 
    Document   : addmin
    Created on : Oct 10, 2023, 12:23:09 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>


        <main class="container mt-5">
            <h2>Liên hệ với chúng tôi</h2>
            <p>Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu nào, xin vui lòng liên hệ với chúng tôi thông qua thông tin dưới đây:</p>
            <div class="row">
                <div class="col-md-6">
                    <address>
                        <strong style="font-size: 20px;">Cửa hàng food and houseware</strong><br>
                        Địa chỉ: Cần Thơ, An Bình, Ninh Kiều, Cần Thơ, Việt Nam<br>
                        Điện thoại: 0982275857<br>
                        Email: chungnp160902@gmail.com<br>
                        <img src="${pageContext.request.contextPath}/imagesproject/NPC.png" style="height: 350px; padding-top: 20px;" alt="alt"/>
                        <p style="margin-left: 100px; font-weight: bold">Addmin</p>
                    </address>
                </div>
                <div class="col-md-6">
                    <h2>Gửi tin nhắn</h2>
                    <p>Nếu bạn muốn gửi tin nhắn cho chúng tôi, vui lòng sử dụng biểu mẫu dưới đây:</p>
                    <form action="process_contact_form.php" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Họ tên:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label for="message" class="form-label">Tin nhắn:</label>
                            <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Send</button>
                        <button type="submit" class="btn btn-danger"><a onclick="return confirm('Are you sure?');" style="color: white; text-decoration: none; " href="/CustomerController/HomePage">Back</a></button>
                    </form>
                </div>
            </div>
        </main>

        <footer class="mt-5 text-center">
            <p>&copy; 2023 Cửa hàng food and houseware.</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>
</html>
