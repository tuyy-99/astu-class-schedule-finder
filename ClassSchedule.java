package edu.astu.model;

public class ClassSchedule {
    private String yearName;
    private String sectionId;
    private String dayName;         // field name
    private String startTime;
    private String endTime;
    private String courseTitle;
    private String activityType;
    private String details;
    private String room;

    // Constructor
    public ClassSchedule(String yearName, String sectionId, String dayName,
                         String startTime, String endTime, String courseTitle,
                         String activityType, String details, String room) {
        this.yearName = yearName;
        this.sectionId = sectionId;
        this.dayName = dayName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.courseTitle = courseTitle;
        this.activityType = activityType;
        this.details = details;
        this.room = room;
    }

    // GETTERS - THESE NAMES ARE CRITICAL!
    public String getYearName() { return yearName; }
    public String getSectionId() { return sectionId; }
    public String getDayName() { return dayName; }        // ← must be getDayName()
    public String getStartTime() { return startTime; }
    public String getEndTime() { return endTime; }
    public String getCourseTitle() { return courseTitle; }
    public String getActivityType() { return activityType; }
    public String getDetails() { return details; }
    public String getRoom() { return room; }

    // Optional: setters if needed
}