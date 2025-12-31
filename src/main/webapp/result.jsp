<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Schedule Result</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Include header -->
    <jsp:include page="schedule.jsp" />

    <div id="result">
        <c:if test="${empty schedules}">
            <p>No schedules found</p>
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
    </div>
</body>
</html>