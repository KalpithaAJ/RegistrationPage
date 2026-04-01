<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 450px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .avatar {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 35px;
        }

        .header h2 {
            color: #667eea;
            font-size: 26px;
            margin-bottom: 5px;
        }

        .header p {
            color: #888;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-size: 14px;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            color: #333;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-group input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
        }

        .form-group input::placeholder {
            color: #bbb;
        }

        .btn-save {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-top: 5px;
        }

        .btn-save:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.5);
        }

        .btn-save:active {
            transform: translateY(0);
        }

        .btn-reset {
            width: 100%;
            padding: 12px;
            background: transparent;
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            margin-top: 10px;
        }

        .btn-reset:hover {
            background: #667eea;
            color: white;
        }

        /* Success message from Spring Model */
        .success-msg {
            background: #e8f5e9;
            color: #2e7d32;
            padding: 10px 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            border-left: 4px solid #2e7d32;
        }

        /* Error message */
        .error-msg {
            background: #ffebee;
            color: #c62828;
            padding: 10px 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            border-left: 4px solid #c62828;
        }
    </style>
</head>
<body>

<div class="container">

    <!-- Header -->
    <div class="header">
        <div class="avatar">👤</div>
        <h2>Register Here</h2>
        <p>Fill in the details below to register</p>
    </div>

    <!-- Success Message from Spring Controller -->
    <% if (request.getAttribute("successMessage") != null) { %>
        <div class="success-msg">
            ✅ <%= request.getAttribute("successMessage") %>
        </div>
    <% } %>

    <!-- Error Message from Spring Controller -->
    <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="error-msg">
            ❌ <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <!-- Form -->
    <form action="/save" method="post">

        <div class="form-group">
            <label for="name">👤 Name</label>
            <input type="text" id="name" name="name"
                   placeholder="Enter your name" required />
        </div>

        <div class="form-group">
            <label for="email">📧 Email</label>
            <input type="email" id="email" name="email"
                   placeholder="Enter your email" required />
        </div>

        <div class="form-group">
            <label for="mobile">📱 Mobile</label>
            <input type="tel" id="mobile" name="mobile"
                   placeholder="Enter 10-digit mobile number"
                   maxlength="10" required />
        </div>

        <input type="submit" class="btn-save"  value="💾 Save" />
        <input type="reset"  class="btn-reset" value="🔄 Reset" />

    </form>

</div>

</body>
</html>