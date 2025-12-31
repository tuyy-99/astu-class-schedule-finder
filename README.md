# ASTU Class Schedule & Room Finder

A Java-based web application developed as an **Advanced Programming** team project. The system helps ASTU students search class schedules and check room availability efficiently using a clean MVC architecture.

---

## 📌 Project Overview

The **ASTU Class Schedule & Room Finder** allows users to:

* Search class schedules by **course, academic year, and section**
* Check **room availability** based on **day and time**
* Dynamically load data using **AJAX**
* View results through user-friendly **JSP pages**

The application is built using **Java (Servlets & JSP)**, **JDBC**, **MySQL**, and follows professional software development practices.

---

## 🧱 Technology Stack

* **Language:** Java
* **Backend:** Servlets, JDBC
* **Frontend:** JSP, HTML, CSS, JavaScript (AJAX)
* **Database:** MySQL
* **Build Tool:** Maven
* **Server:** Apache Tomcat
* **Version Control:** Git & GitHub
* **Project Management:** Jira

---

## 🗂️ Project Structure

```
astu-schedule-finder/
├── src/main/java/edu/astu/
│   ├── controller/        # Servlets (Schedule, AJAX, Room Availability)
│   ├── dao/               # Data Access Objects
│   ├── model/             # Java Model Classes
│   └── util/              # JDBC Utilities
│
├── src/main/webapp/
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript (AJAX logic)
│   ├── images/            # Logos and assets
│   ├── WEB-INF/           # web.xml configuration
│   └── *.jsp              # JSP pages
│
├── ASTU_Class_Schedule.sql
├── pom.xml
└── README.md
```

---

## 👥 Team Structure (6 Members)

### 👤 Team Leader

**Responsible for:**

* Overall project coordination
* Architecture design
* Code reviews and final integration
* Jira task management

👥 Team Members

👤 Team Leader

Tursina Yisehak – Project coordination, task planning, architecture oversight, final integration and documentation .

👤 Team Members

Elham Seid – Backend development (DAO implementation, JDBC utilities, model classes)

Foziya Jemal – Database schema design and SQL implementation

Sumeya Abdi – Servlet development and request handling

Michael Gizachew – Frontend development (JSP, CSS, JavaScript, AJAX)

Bilal Usman – Testing, debugging, and quality assurance

---

🔄 Development Workflow

Scrum tasks were created and assigned in Jira

Each task was developed in a separate Git feature branch

Commits followed clear, descriptive messages

Changes were merged after task completion

---

## ⚙️ Setup & Run Instructions

1. **Clone the repository**

```bash
git clone <repository-url>
```

2. **Import into IntelliJ IDEA**

* Open IntelliJ → Open Project → Select project folder
* Reload Maven dependencies

3. **Configure Database**

* Create MySQL database
* Run `ASTU_Class_Schedule.sql`
* Update DB credentials in `DBConnection.java`

4. **Deploy on Tomcat**

* Configure Apache Tomcat in IntelliJ
* Run the project

5. **Access Application**

```
http://localhost:8080/astu-schedule-finder
```

---

## 🧪 Key Features

* MVC architecture
* Secure JDBC connection handling
* AJAX-powered dynamic dropdowns
* Clean UI with responsive design
* Modular and maintainable codebase

---
🖼️ Screenshots

🔍 Class Schedule Search

Shows the schedule search form with course, academic year, and section selection.
<img width="1280" height="576" alt="image" src="https://github.com/user-attachments/assets/f53e5457-9fdd-46b2-b17d-b3586e4221cf" />



📋 Schedule Results

Displays the retrieved class schedules after submitting the search.

<img width="1280" height="575" alt="image" src="https://github.com/user-attachments/assets/2763302d-6aff-4baa-a777-01575771b8f9" />

🏫 Room Availability Search

Illustrates the room availability search by day and time.

<img width="1280" height="579" alt="image" src="https://github.com/user-attachments/assets/2a049f8a-d660-4b66-923a-5a9847b47f36" />
✅ Available Rooms Result

Shows available rooms based on the selected criteria.

<img width="1280" height="581" alt="image" src="https://github.com/user-attachments/assets/925c370e-1e07-4180-88a0-98970be8ac95" />  <img width="1280" height="576" alt="image" src="https://github.com/user-attachments/assets/662c8121-35b6-4a84-aac3-7c865572b974" />

ℹ️ About

<img width="1280" height="578" alt="image" src="https://github.com/user-attachments/assets/02ebf6b5-1f19-42b1-a43f-b0895b1a3082" />


✅ Current Status

All core features are implemented, tested, and ready for evaluation. The project demonstrates proper use of layered architecture, team collaboration, and modern Java web development practices.

## 📜 License

This project is developed for **academic purposes** as part of the Advanced Programming course at ASTU.

---

## ✨ Acknowledgments

* ASTU Faculty of Computing
* Advanced Programming Course instructor
* Team members for effective collaboration

---

**© 2025 ASTU – Advanced Programming Team Project**
