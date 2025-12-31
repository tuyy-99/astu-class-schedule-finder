package edu.astu.dao;

import edu.astu.model.ClassSchedule;
import edu.astu.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDao {

    public List<String> getCourses() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT DISTINCT course_title FROM course ORDER BY course_title";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(rs.getString(1));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public List<String> getYears() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT year_name FROM academic_year ORDER BY year_id";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(rs.getString(1));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public List<String> getSections(String yearName) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT section_id FROM section s JOIN academic_year ay ON s.year_id = ay.year_id WHERE ay.year_name = ? ORDER BY section_id";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, yearName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(rs.getString(1));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public List<ClassSchedule> searchSchedules(String course, String year, String section) {
        List<ClassSchedule> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT ay.year_name, s.section_id, sc.day_name, ts.start_time, ts.end_time, " +
            "c.course_title, sc.activity_type, sc.details, sc.room " +
            "FROM schedule sc " +
            "JOIN course c ON sc.course_code = c.course_code " +
            "JOIN section s ON sc.section_id = s.section_id " +
            "JOIN academic_year ay ON s.year_id = ay.year_id " +
            "JOIN time_slot ts ON sc.time_slot_id = ts.time_slot_id " +
            "WHERE 1=1 "
        );
        if (course != null && !course.isEmpty()) sql.append("AND c.course_title = ? ");
        if (year != null && !year.isEmpty()) sql.append("AND ay.year_name = ? ");
        if (section != null && !section.isEmpty()) sql.append("AND s.section_id = ? ");
        sql.append("ORDER BY sc.day_name, ts.start_time");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            int index = 1;
            if (course != null && !course.isEmpty()) ps.setString(index++, course);
            if (year != null && !year.isEmpty()) ps.setString(index++, year);
            if (section != null && !section.isEmpty()) ps.setString(index++, section);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassSchedule(
                    rs.getString(1), rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6),
                    rs.getString(7), rs.getString(8), rs.getString(9)
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}
