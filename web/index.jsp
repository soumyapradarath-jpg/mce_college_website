<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern College of Engineering - Home</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f4ff;
        display: flex;
    }

    /* Sidebar */
    .sidebar {
        width: 60px;
        background-color: #003366;
        color: white;
        transition: width 0.3s;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        overflow: hidden;
        z-index: 1000;
    }

    .sidebar:hover { width: 200px; }

    .sidebar h2 {
        text-align: center;
        margin: 20px 0;
        font-family: 'Montserrat', sans-serif;
        font-size: 1.2em;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 20px 0;
    }

    .sidebar ul li {
        padding: 15px;
        cursor: pointer;
        transition: background 0.3s;
        white-space: nowrap;
    }

    .sidebar ul li:hover { background-color: #0055aa; }

    .sidebar ul li a {
        color: white;
        text-decoration: none;
        display: block;
        font-weight: bold;
        font-size: 1em;
    }

    /* Content */
    .content {
        margin-left: 60px;
        padding: 40px 30px;
        flex: 1;
        transition: margin-left 0.3s;
    }

    .sidebar:hover ~ .content { margin-left: 200px; }

    .content h1 {
        font-family: 'Montserrat', sans-serif;
        color: #003366;
        font-size: 2.5em;
        margin-bottom: 20px;
    }

    /* College Section */
    .college-section {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        margin-bottom: 40px;
        align-items: center;
    }

    .college-image {
        flex: 1 1 500px;
        max-height: 500px;
        object-fit: cover;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        transition: transform 0.3s;
    }

    .college-image:hover { transform: scale(1.02); }

    .college-text {
        flex: 2 1 400px;
        font-size: 1.1em;
        line-height: 1.7em;
        color: black;
    }

    .college-text span { color: red; font-weight: bold; }

    /* Notifications */
    .notifications {
        background-color: #ffe6e6;
        border-left: 5px solid red;
        padding: 15px 20px;
        border-radius: 8px;
        margin-bottom: 40px;
        transition: transform 0.3s;
    }

    .notifications:hover { transform: translateY(-3px); }

    .notifications h3 { margin-top: 0; color: #b30000; }
    .notifications p { margin: 5px 0; }

    /* Sections */
    .section {
        margin-bottom: 50px;
    }

    .section-title {
        font-family: 'Montserrat', sans-serif;
        color: #003366;
        text-align: center;
        font-size: 1.8em;
        margin-bottom: 20px;
    }

    .section-content {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 30px;
        justify-content: center;
    }

    .section-content img {
        flex: 1 1 300px;
        border-radius: 12px;
        box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        transition: transform 0.3s;
    }

    .section-content img:hover { transform: scale(1.05); }

    .section-content p {
        flex: 2 1 400px;
        font-size: 1em;
        line-height: 1.6em;
        color: black;
    }

    footer {
        background-color: #003366;
        color: white;
        text-align: center;
        padding: 15px 0;
        margin-top: 50px;
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
    }

    @media(max-width: 768px){
        .sidebar { width: 50px; }
        .sidebar:hover { width: 150px; }
        .content { padding: 20px; }
        .college-section, .section-content { flex-direction: column; align-items: center; }
        .college-text, .section-content p { flex: 1 1 100%; }
        .college-image, .section-content img { flex: 1 1 90%; max-height: none; }
    }
</style>
</head>
<body>

<div class="sidebar">
    <h2>MCE</h2>
    <ul>
        <li><a href="collegecms_frontend/index.jsp">Home</a></li>
        <li><a href="collegecms_frontend/addmission.jsp">Admission</a></li>
        <li><a href="student_portal.jsp">Student Portal</a></li>
        <li><a href="collegecms_frontend/courses.jsp">Courses</a></li>
        <li><a href="login.jsp">Student Login</a></li>
    </ul>
</div>

<div class="content">
    <h1>Welcome to Modern College of Engineering</h1>

    <div class="college-section">
        <img src="images/college.jpg" alt="College" class="college-image">
        <div class="college-text">
            <p><span>Modern College of Engineering</span> is a premier institute dedicated to technical education and innovation. Students learn cutting-edge technologies and gain hands-on experience in practical labs.</p>
            <p>Our campus provides <span>state-of-the-art facilities</span>, extensive libraries, and well-equipped classrooms. Cultural programs and technical fests enhance learning beyond academics, encouraging <span>leadership and creativity</span>.</p>
        </div>
    </div>

    <div class="notifications">
        <h3>Notifications</h3>
        <p><strong>16 Oct 2025:</strong> New Semester registration opens.</p>
        <p><strong>10 Oct 2025:</strong> Cultural program registration closed.</p>
        <p><strong>01 Oct 2025:</strong> Back paper clearance schedule released.</p>
    </div>

    <div class="section">
        <h2 class="section-title">Cultural Programs & Achievements</h2>
        <div class="section-content">
            <img src="images/cultural.jpg" alt="Cultural Program">
            <p>Our college organizes annual cultural events, competitions, and fests. Students participate in music, dance, drama, and technical presentations to showcase talent and teamwork, earning accolades every year.</p>
        </div>
    </div>

    <div class="section">
        <h2 class="section-title">Students in Action</h2>
        <div class="section-content">
            <img src="images/student.jpg" alt="Students">
            <p>Students actively engage with books, laptops, and projects, gaining practical knowledge. Workshops, seminars, and collaborative learning foster skills and innovation to prepare them for future careers.</p>
        </div>
    </div>

</div>

<footer>
    &copy; 2025 Modern College of Engineering. All Rights Reserved.
</footer>

</body>
</html>