package edu.astu.controller;

import edu.astu.dao.ScheduleDao;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;   // ← THIS IS THE MISSING ONE
import java.util.List;       // ← AND THIS

@WebServlet("/ajax")
public class AjaxServlet extends HttpServlet {
    private final ScheduleDao dao = new ScheduleDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<String> data = new ArrayList<>();
        if ("courses".equals(action)) data = dao.getCourses();
        else if ("years".equals(action)) data = dao.getYears();
        else if ("sections".equals(action)) data = dao.getSections(request.getParameter("year"));

        response.getWriter().print(new Gson().toJson(data));
    }
}
