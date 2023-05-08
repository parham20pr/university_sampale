package com.example.service;

import com.example.model.entity.Teacher;

import java.util.List;

public interface TeacherService {

    List<Teacher> getAllTeacher();

    String saveTeacher(Teacher teacher);

    String deleteTeacherById(int id);

    Teacher getTeacherById(int id);
}
