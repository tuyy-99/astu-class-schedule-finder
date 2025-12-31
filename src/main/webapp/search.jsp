<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find Schedule - ASTU Schedule Finder</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <i class="fas fa-university"></i>
                <h1>ASTU Schedule Finder</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/schedule" class="active"><i class="fas fa-search"></i> Find Schedule</a></li>
                    <li><a href="${pageContext.request.contextPath}/schedule?action=room"><i class="fas fa-door-open"></i> Room Finder</a></li>
                    <li><a href="#"><i class="fas fa-info-circle"></i> About</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <div class="search-container">
                <h2><i class="fas fa-search"></i> Find Class Schedule</h2>
                <p>Select your department, year, semester, and section to view your schedule.</p>

                <form action="${pageContext.request.contextPath}/schedule" method="get" id="scheduleForm">
                    <input type="hidden" name="action" value="find">

                    <div class="form-group">
                        <label for="department"><i class="fas fa-building"></i> Department:</label>
                        <select id="department" name="department" required>
                            <option value="">Select Department</option>
                            <c:forEach var="dept" items="${departments}">
                                <option value="${dept.departmentId}">${dept.departmentCode} - ${dept.departmentName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="year"><i class="fas fa-graduation-cap"></i> Year:</label>
                            <select id="year" name="year" required>
                                <option value="">Select Year</option>
                                <option value="1">Year 1</option>
                                <option value="2">Year 2</option>
                                <option value="3">Year 3</option>
                                <option value="4">Year 4</option>
                                <option value="5">Year 5</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="semester"><i class="fas fa-calendar"></i> Semester:</label>
                            <select id="semester" name="semester" required>
                                <option value="">Select Semester</option>
                                <option value="1">Semester 1</option>
                                <option value="2">Semester 2</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="section"><i class="fas fa-users"></i> Section:</label>
                        <select id="section" name="section" required>
                            <option value="">Select Section</option>
                            <!-- Sections will be loaded via AJAX -->
                        </select>
                        <small class="text-muted">Select department, year, and semester first</small>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i> Find Schedule
                    </button>
                </form>

                <div class="instructions">
                    <h3><i class="fas fa-info-circle"></i> How to Use:</h3>
                    <ol>
                        <li>Select your department from the list</li>
                        <li>Choose your academic year (1-5)</li>
                        <li>Select the semester (1 or 2)</li>
                        <li>Choose your section (A, B, C, etc.)</li>
                        <li>Click "Find Schedule" to view your timetable</li>
                    </ol>
                </div>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 ASTU Schedule Finder. All rights reserved.</p>
        </footer>
    </div>

    <script>
    $(document).ready(function() {
        $('#department, #year, #semester').change(function() {
            var deptId = $('#department').val();
            var year = $('#year').val();
            var semester = $('#semester').val();

            if (deptId && year && semester) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/ajax',
                    type: 'GET',
                    data: {
                        type: 'sections',
                        departmentId: deptId,
                        year: year,
                        semester: semester
                    },
                    success: function(data) {
                        $('#section').html(data);
                    }
                });
            }
        });
    });
    </script>
</body>
</html>