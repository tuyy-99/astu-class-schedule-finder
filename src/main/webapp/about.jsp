<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About - ASTU Schedule Finder</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/astu-logo.png" alt="ASTU">
            <h1>ASTU Schedule Finder</h1>
        </div>
        <nav>
            <a href="schedule.jsp">Schedules</a>
            <a href="room-search.jsp">Room Search</a>
            <a href="about.jsp" class="active">About</a>
        </nav>
    </header>

    <main style="padding: 60px; text-align: center;">
        <h2>About This Application</h2>
        <p style="font-size: 1.2em; max-width: 800px; margin: 40px auto; line-height: 1.8;">
            ASTU Schedule Finder is a web application designed to help students and faculty at
            <strong>Adama Science and Technology University</strong> easily view class schedules
            and check room availability.
        </p>
        <p><strong>Features:</strong></p>
        <ul style="display: inline-block; text-align: left; font-size: 1.1em; line-height: 2;">
            <li>Search schedules by course, year, and section</li>
            <li>Check if a room is free or occupied at a specific time</li>
            <li>Fast and simple interface</li>
        </ul>
        <p style="margin-top: 40px;">Developed with Java Servlets, JSP, MySQL, and AJAX.</p>
        <p>© 2025 Adama Science and Technology University</p>
    </main>

    <footer>
        <p>© 2025 Adama Science and Technology University</p>
    </footer>
</body>
</html>