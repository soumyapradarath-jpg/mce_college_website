<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses - RIC Institute</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e6f0ff; /* light blue */
        }

        /* Header */
        header {
            background-color: #003366; /* deep blue */
            color: white;
            padding: 25px 0;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        header h1 {
            margin: 0;
            font-size: 2.2em;
        }

        /* Container for courses */
        .course-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 30px 20px;
            gap: 20px;
        }

        /* Individual course card */
        .course-card {
            background-color: white;
            border: 2px solid #003366;
            border-radius: 12px;
            width: 220px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        .course-card h3 {
            color: #003366;
            margin-bottom: 10px;
            font-size: 1.3em;
        }

        .course-card p {
            color: #555;
            font-size: 0.95em;
            line-height: 1.4;
        }

        /* Footer */
        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
        }

        @media (max-width: 600px) {
            .course-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>Our Engineering Courses</h1>
    </header>

    <div class="course-container">
        <div class="course-card">
            <h3>Computer Science</h3>
            <p>Focus on software, programming, AI, and web technologies.</p>
        </div>
        <div class="course-card">
            <h3>Mechanical Engineering</h3>
            <p>Learn about machines, engines, robotics, and manufacturing.</p>
        </div>
        <div class="course-card">
            <h3>Civil Engineering</h3>
            <p>Design and build infrastructure like roads, bridges, and buildings.</p>
        </div>
        <div class="course-card">
            <h3>Electrical Engineering</h3>
            <p>Explore circuits, electronics, power systems, and renewable energy.</p>
        </div>
        <div class="course-card">
            <h3>Electronics & Communication</h3>
            <p>Study communication systems, embedded systems, and digital electronics.</p>
        </div>
        <div class="course-card">
            <h3>Information Technology</h3>
            <p>Specialize in networking, databases, cybersecurity, and software development.</p>
        </div>
    </div>

    <footer>
        &copy; 2025 RIC Institute. All Rights Reserved.
    </footer>

</body>
</html>