<%-- 
    Document   : signup
    Created on : Jun 8, 2024, 3:44:13 AM
    Author     : Tran Tran
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Multi Step Form | CodingNepal</title>
    <link rel="stylesheet" href="styles/signup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <title>Sign-Up Page</title>
</head>
<body>

<div class="container">
    <header>Signup Form</header>
    <div class="progress-bar">
        <div class="step">
            <p>
                Name
            </p>
            <div class="bullet">
                <span>1</span>
            </div>
            <div class="check fas fa-check"></div>
        </div>
        <div class="step">
            <p>
                Contact
            </p>
            <div class="bullet">
                <span>2</span>
            </div>
            <div class="check fas fa-check"></div>
        </div>
        <div class="step">
            <p>
                Birth
            </p>
            <div class="bullet">
                <span>3</span>
            </div>
            <div class="check fas fa-check"></div>
        </div>
        <div class="step">
            <p>
                Submit
            </p>
            <div class="bullet">
                <span>4</span>
            </div>
            <div class="check fas fa-check"></div>
        </div>
    </div>
    <div class="form-outer">
        <form action="signup" method="post">
            <div class="page slide-page">
                <div class="title">
                    Basic Info:
                </div>
                <div class="field">
                    <div class="label">
                        First Name
                    </div>
                    <input type="text" name="name" required><br>
                </div>
                <div class="field">
                    <div class="label">
                        Last Name
                    </div>
                    <input type="text" name="name" required><br>
                </div>
                <div class="field">
                    <button class="firstNext next">Next</button>
                </div>
            </div>
            <div class="page">
                <div class="title">
                    Contact & Adress:
                </div>
                <div class="field">
                    <div class="label">
                        Address
                    </div>
                    <input type="text" name="address" required><br>
                </div>
                <div class="field">
                    <div class="label">
                        Phone Number
                    </div>
                    <input type="text" name="phone" required><br>
                </div>
                <div class="field btns">
                    <button class="prev-1 prev">Previous</button>
                    <button class="next-1 next">Next</button>
                </div>
            </div>
            <div class="page">
                <div class="title">
                    Date of Birth:
                </div>
                <div class="field">
                    <div class="label">
                        Date
                    </div>
                    <input type="date" name="DOB" required><br>
                </div>
                <div class="field">
                    <div class="label">
                        Email
                    </div>
                    <input type="email" name="email" required><br>
                </div>
                <div class="field btns">
                    <button class="prev-2 prev">Previous</button>
                    <button class="next-2 next">Next</button>
                </div>
            </div>
            <div class="page">
                <div class="title">
                    Login Details:
                </div>
                <div class="field">
                    <div class="label">
                        Username
                    </div>
                    <input type="text" name="username" required>
                </div>
                <div class="field">
                    <div class="label">
                        Password
                    </div>
                    <input type="password" name="password" required>
                </div>
                <div class="field btns">
                    <button class="prev-3 prev">Previous</button>
                    <button class="submit" value="Sign Up">Submit</button>
                </div>
            </div>
        </form>
    </div>
    <a href="mainLogin.jsp">Login here!</a>
</div>
<script src="JS/signup.js"></script>


<%--    <h2>Sign Up</h2>--%>
<%--    <form action="signup" method="post">--%>
<%--        Username: <input type="text" name="username" required><br>--%>
<%--        Password: <input type="password" name="password" required><br>--%>
<%--        <input type="submit" value="Sign Up">--%>
<%--    </form>--%>
<%--    <a href="index.jsp">Already have an account? Login here!</a>--%>
</body>
</html>