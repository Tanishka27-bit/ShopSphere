<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Register</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-box {
            background: white;
            width: 350px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #222;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #444;
        }
    </style>
</head>

<body>

<div class="register-box">

    <h2>Create Account</h2>

    <form action="register" method="post">

        <input type="text"
               name="name"
               placeholder="Enter Name"
               required>

        <input type="email"
               name="email"
               placeholder="Enter Email"
               required>

        <input type="password"
               name="password"
               placeholder="Enter Password"
               required>

        <input type="text"
               name="mobile"
               placeholder="Enter Mobile Number"
               required>

        <button type="submit">Register</button>

    </form>

</div>

</body>
</html>