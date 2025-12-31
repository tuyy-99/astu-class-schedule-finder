<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Room Availability Result</title>
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
            <a href="room-search.jsp" class="active">Room Search</a>
            <a href="about.jsp">About</a>
        </nav>
    </header>

    <main>
        <h2>Room Availability</h2>
        <div class="search-bar" style="margin-bottom: 20px; font-size: 1.1em;">
            <strong>Room:</strong> ${room} &nbsp; | &nbsp;
            <strong>Day:</strong> ${day} &nbsp; | &nbsp;
            <strong>Time:</strong> ${time}
        </div>

        <div class="result-box" style="padding: 30px; text-align: center; background: #111; border-radius: 15px;">
            <c:choose>
                <c:when test="${available}">
                    <p style="color: #4CAF50; font-size: 1.8em; font-weight: bold;">Room is AVAILABLE</p>
                </c:when>
                <c:otherwise>
                    <p style="color: #f44336; font-size: 1.8em; font-weight: bold;">Room is OCCUPIED</p>
                    <table>
                        <thead>
                            <tr>
                                <th>Course</th>
                                <th>Section</th>
                                <th>Type</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="occ" items="${occupied}">
                                <tr>
                                    <td>${occ[0]}</td>
                                    <td>${occ[1]}</td>
                                    <td>${occ[2]}</td>
                                    <td>${occ[3]}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
            <br>
            <a href="room-search.jsp" style="color: #2196F3;">← Back to Search</a>
        </div>
    </main>

    <footer>
        <p>© 2025 Adama Science and Technology University</p>
    </footer>
</body>
</html>