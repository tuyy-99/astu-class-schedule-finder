<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Room Availability</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/app.js"></script>
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/astu-logo.png" alt="ASTU">
            <h1>ASTU Schedule Finder</h1>
        </div>
         <nav>
                    <a href="schedule.jsp" class="active">Schedules</a>
                    <a href="room-search.jsp">Room Search</a>
                    <a href="about.jsp">About</a>
                </nav>
    </header>

    <main>
        <h2>Room Availability</h2>
        <form action="room-availability" method="post" class="search-bar">
            <select name="room" required>
                <option value="">Select Room</option>
            </select>

            <select name="day" required>
                <option value="">Select Day</option>
            </select>

            <select name="time" required>
                <option value="">Select Time</option>
            </select>

            <button type="submit">Check Availability</button>
        </form>

        <div id="result">
            <p>Please select all fields</p>
        </div>
    </main>

    <footer>
        <p>© 2025 Adama Science and Technology University</p>
    </footer>
</body>
</html>