package com.shadedgames.student_info_system.helper_classes;

import com.google.gson.Gson;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Profile {
    private int id;
    private String studentId;
    private String password;
    private String name;
    private String course;
    private int age;

    public Profile() {
    }

    public Profile(int id, String studentId, String password) {
        this.id = id;
        this.studentId = studentId;
        this.password = password;
    }

    public Profile(int id, String studentId, String password, String course, String name, int age) {
        this.studentId = studentId;
        this.password = password;
        this.course = course;
        this.name = name;
        this.age = age;
        this.id = id;

    }
    public Profile( String studentId, String password, String course, String name, int age) {
        this.studentId = studentId;
        this.password = password;
        this.course = course;
        this.name = name;
        this.age = age;

    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return this.password;
    }

    public String getStudentId() {
        return this.studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public String getCourse() {
        return course;
    }

    public String getName() {
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String testGson() {
        Gson gson = new Gson();
        Map<String, Object> profileMap = new HashMap<>();
        profileMap.put("id", getId());
        profileMap.put("studentId", getStudentId());
        profileMap.put("password", getPassword());
        profileMap.put("name", getName());
        profileMap.put("course", getCourse());
        profileMap.put("age", getAge());
        String output = gson.toJson(profileMap);

        return output;

    }
}
