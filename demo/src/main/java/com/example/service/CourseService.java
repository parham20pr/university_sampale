package com.example.service;

import com.example.model.entity.Course;

import java.util.List;

public interface CourseService {

    List<Course> getAllCourse();

    String saveCourse(Course course);

    String deleteCourseById(int id);

    Course getCourseById(int id);

    void  addTeacherToCourse (int teacherId,int courseId);

    List<Course> showCourseToTeacher(int teacherId);

    Integer deleteTeacherIdInCourse(int courseId);

}
