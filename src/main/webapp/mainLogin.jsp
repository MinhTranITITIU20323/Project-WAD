<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./styles/mainLogin.css">
    <title>Login Page</title>
</head>
<body class="login-page">
<div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
</div>
<div class="wrapper">
    <h2>Login</h2>
    <form action="login" method="post">
        <div class="input-box">
            <label for="username">Username:</label>
            <input type="text" id="username" placeholder="Username" name="username" required>
        </div>
        <div class="input-box">
            <label for="password">Password:</label>
            <input type="password" id="password" placeholder="Password" name="password" required>
        </div>
        <button type="submit" class="btn">Login</button>
        <div class="register-link">
            Don't have an account? <a href="signup.jsp">Sign up</a>
        </div>
    </form>
</div>
</body>
</html>