<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - ASTU Schedule Finder</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
                    <li><a href="${pageContext.request.contextPath}/schedule"><i class="fas fa-search"></i> Find Schedule</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <div class="error-container">
                <div class="error-icon">
                    <i class="fas fa-exclamation-triangle fa-4x"></i>
                </div>
                <h2>Oops! Something went wrong</h2>
                <p class="error-message">${not empty error ? error : 'An unexpected error occurred.'}</p>
                <div class="error-actions">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                        <i class="fas fa-home"></i> Go Home
                    </a>
                    <a href="${pageContext.request.contextPath}/schedule" class="btn btn-secondary">
                        <i class="fas fa-search"></i> Try Again
                    </a>
                </div>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 ASTU Schedule Finder. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>