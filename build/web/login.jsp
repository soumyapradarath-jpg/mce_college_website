<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern College of Engineering - Student Portal</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #e6f0ff;
    }
    header {
        background-color: #003366;
        color: white;
        padding: 20px;
        text-align: center;
    }
    header h1 {
        margin: 0;
    }

    .container {
        max-width: 500px;
        margin: 40px auto;
        background-color: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        color: #003366;
        margin-bottom: 20px;
    }

    .input-group {
        margin: 12px 0;
        position: relative;
    }

    .input-group input {
        width: 100%;
        padding: 12px;
        border: 2px solid #003366;
        border-radius: 8px;
    }

    .input-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #003366;
    }

    .eye-icon {
        position: absolute;
        top: 50%;
        right: 12px;
        transform: translateY(-50%);
        cursor: pointer;
        font-size: 18px;
        color: #003366;
    }

    .btn {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        background-color: #003366;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1em;
        transition: 0.3s;
    }
    .btn:hover { background-color: #0055aa; }

    .forgot {
        text-align: right;
        margin-top: 8px;
    }

    .forgot a {
        color: #003366;
        text-decoration: none;
        font-size: 0.9em;
    }
    .forgot a:hover { color: #0055aa; }

    .student-details {
        display: none; /* hidden initially */
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    .student-details h3 {
        text-align: center;
        color: #003366;
        margin-bottom: 20px;
    }

    .avatar {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background-color: #cccccc;
        display: block;
        margin: 0 auto 15px;
        font-size: 50px;
        color: white;
        line-height: 100px;
        text-align: center;
    }

    .info p {
        margin: 8px 0;
        font-weight: bold;
        color: #003366;
    }

    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
    }

    .card {
        background-color: white;
        border: 2px solid #003366;
        border-radius: 12px;
        width: 200px;
        padding: 15px;
        text-align: center;
        transition: 0.3s;
    }
    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 15px rgba(0,0,0,0.2);
    }

    footer {
        background-color: #003366;
        color: white;
        text-align: center;
        padding: 15px 0;
        margin-top: 30px;
    }
    .floating-btn {
      position: fixed;
      bottom: 30px;
      right: 30px;
      background-color: red;
      color: white;
      font-size: 28px;
      text-align: center;
      line-height: 55px;
      width: 55px;
      height: 55px;
      border-radius: 50%;
      text-decoration: none;
      box-shadow: 0 4px 10px rgba(0,0,0,0.3);
      transition: all 0.3s ease;
      z-index: 1000;
    }
    #Home{
        background-color: #007BFF;
    }
    
    .floating-btn:hover {
      background-color: #0056b3;
      transform: scale(1.1);
    }
    
    span{
        font-size: 15px;
    }
    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-6px); }
    }

    .floating-btn {
      animation: float 2s infinite ease-in-out;
    }

    @media(max-width:600px){
        .card { width: 90%; }
    }
</style>
</head>
<body>
    <% 
        if(request.getParameter("error")!=null)
        {
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Error!</strong> <%= request.getParameter("error") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
        }
    %>
<header>
    <h1>Modern College of Engineering - Student Portal</h1>
    <a href="index.jsp" class="floating-btn" id="Home" title="Contact Us">
    <span>Home</span>
  </a>
</header>

<div class="container" id="loginDiv">
    <h2>Student Login</h2>
    <form action="Login" method="post">
    <div class="input-group">
        <label for="userId">User ID</label>
        <input type="text" id="userId" placeholder="Enter your User ID" name="username">
    </div>

    <div class="input-group">
        <label for="collegeRoll">College Roll Number</label>
        <input type="text" id="collegeRoll" placeholder="Enter your Roll Number" name="roll">
    </div>

    <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" placeholder="Enter Password" name="password">
        <span class="eye-icon" onclick="togglePassword()">??</span>
    </div>
        
    <div class="input-group">
        <label for="email">Email Id</label>
        <input type="email" id="email" placeholder="Enter Email" name="email">
    </div>

    <div class="input-group">
        <label for="captcha">Captcha: <span id="captchaText"></span></label>
        <input type="text" id="captcha" placeholder="Enter Captcha">
    </div>

        <input class="btn" onclick="login()" type="submit">
    </form>
    <div class="forgot">
        <a href="#" onclick="alert('Forgot Password functionality demo')">Forgot Password?</a>
    </div>
</div>

<footer>
    &copy; 2025 Modern College of Engineering. All Rights Reserved.
</footer>

<script>
    // Generate simple captcha
    function generateCaptcha() {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        let captcha = '';
        for(let i=0;i<5;i++){
            captcha += chars.charAt(Math.floor(Math.random()*chars.length));
        }
        document.getElementById('captchaText').textContent = captcha;
        return captcha;
    }

    let currentCaptcha = generateCaptcha();

    function togglePassword(){
        const pwd = document.getElementById('password');
        const icon = document.querySelector('.eye-icon');
        if(pwd.type==='password'){pwd.type='text'; icon.textContent='?';}
        else{pwd.type='password'; icon.textContent='??';}
    }
        function login(){
        const userId = document.getElementById('userId').value;
        const collegeRoll = document.getElementById('collegeRoll').value;
        const password = document.getElementById('password').value;
        const captcha = document.getElementById('captcha').value;

        if(!userId || !collegeRoll || !password || !captcha){
            alert('Please fill all fields!');
            return;
        }

        if(captcha !== document.getElementById('captchaText').textContent){
            alert('Captcha incorrect!');
            currentCaptcha = generateCaptcha();
            document.getElementById('password').value=null;
            return;
        }
    }
        
        
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
 
</body>
</html>