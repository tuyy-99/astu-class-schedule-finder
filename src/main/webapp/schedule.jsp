<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ASTU Schedule Finder - Class Schedules</title>
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
        <h2>Class Schedules</h2>

        <div class="search-bar">
            <form action="schedule" method="post">
                <input type="text" name="course" placeholder="Select course" list="courses">
                <datalist id="courses"></datalist>

                <select name="year" id="year">
                    <option value="">Year</option>
                </select>

                <select name="section" id="section">
                    <option value="">Section</option>
                </select>

                <button type="submit">Search</button>
            </form>
        </div>

        <div id="result">
            <p>Please use the form above to search for schedules.</p>
        </div>
    </main>

    <footer>
        <p>© 2025 Adama Science and Technology University</p>
    </footer>

    <!-- Load dropdown data on page load -->
    <script>
        // This runs when the page loads to populate Year, Courses, and prepare Section
        window.onload = function() {
            if (location.href.includes('schedule.jsp')) {
                // These will now use the correct contextPath from app.js
                loadOptions(contextPath + '/ajax?action=courses', '#courses');
                loadOptions(contextPath + '/ajax?action=years', '#year');

                document.getElementById('year').onchange = function() {
                    const yearVal = this.value;
                    const sectionSelect = document.getElementById('section');
                    if (yearVal) {
                        loadOptions(contextPath + '/ajax?action=sections&year=' + encodeURIComponent(yearVal), '#section');
                    } else {
                        sectionSelect.innerHTML = '<option value="">Section</option>';
                    }
                };
            }
        };
    </script>
</body>
</html>