package edu.astu.controller;

import edu.astu.dao.ScheduleDao;
import edu.astu.model.ClassSchedule;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/schedule")
public class ScheduleServlet extends HttpServlet {
    private final ScheduleDao dao = new ScheduleDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<ClassSchedule> schedules = dao.searchSchedules(
                request.getParameter("course"),
                request.getParameter("year"),
                request.getParameter("section")
        );

        request.setAttribute("schedules", schedules);
        request.getRequestDispatcher("schedule-result.jsp").forward(request, response);
    }
}
