package com.example.service;

import com.example.model.entity.Course;
import com.example.model.entity.Student;

import java.util.List;

public interface StudentService {

    List<Student> getAllStudent();

    String saveStudent (Student student);

    String deleteStudentById(int id);

    Student getStudentById(int id);

    String addCourseToStudent(int studentId,int courseId);

    List<Course> getCourseByStudentId(int studentId);

    String deleteCourseById(int studentId,int courseId);
}
