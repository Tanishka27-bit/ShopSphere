<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - ShopSphere</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: white;
            width: 350px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background: #222;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #444;
        }
    </style>
</head>

<body>

<div class="login-box">

    <h2>Admin Login</h2>

    <form action="adminLogin" method="post">

        <label>Email</label>
        <input type="email"
               name="email"
               placeholder="Enter admin email"
               required>

        <label>Password</label>
        <input type="password"
               name="password"
               placeholder="Enter admin password"
               required>

        <button type="submit">
            Login as Admin
        </button>

    </form>

</div>

</body>
</html>
