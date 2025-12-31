<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Schedule Results</title>
    <link rel="stylesheet" href="css/style.css">
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
        <h2>Schedule Results</h2>

        <div style="margin: 20px 0;">
            <a href="schedule.jsp" style="color: #2196F3; font-size: 1.1em;">← Back to Search</a>
        </div>

        <c:if test="${empty schedules}">
            <div style="padding: 50px; text-align: center; background: #111; border-radius: 15px;">
                <p style="font-size: 1.6em; color: #ccc;">No schedules found for your search.</p>
            </div>
        </c:if>

        <c:if test="${not empty schedules}">
            <table>
                <thead>
                    <tr>
                        <th>Day</th>
                        <th>Time</th>
                        <th>Course</th>
                        <th>Type</th>
                        <th>Room</th>
                        <th>Details</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${schedules}">
                        <tr>
                            <td>${s.dayName}</td>
                            <td>${s.startTime} - ${s.endTime}</td>
                            <td>${s.courseTitle}</td>
                            <td>${s.activityType}</td>
                            <td>${s.room}</td>
                            <td>${s.details}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </main>

    <footer>
        <p>© 2025 Adama Science and Technology University</p>
    </footer>
</body>
</html>
