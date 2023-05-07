package com.example.service;

import com.example.model.entity.Course;
import com.example.repository.CourseRepository;
import com.example.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class CourseServiceImp implements CourseService{

    @Autowired
    CourseRepository courseRepository;

    @Autowired
    TeacherRepository teacherRepository;

    @Override
    public List<Course> getAllCourse() {
        return courseRepository.findAll();
    }

    @Override
    public String saveCourse(Course course) {
        courseRepository.save(course);
        return null;
    }

    @Override
    public String deleteCourseById(int id) {
         courseRepository.deleteAllById(Collections.singleton(id));
        return null;
    }

    @Override
    public Course getCourseById(int id) {
        Optional<Course>courseOptional = courseRepository.findById(id);
        Course course = null;
        if (courseOptional.isPresent()){
            course=courseOptional.get();
        }else
        {
            throw new RuntimeException("id morde nazare nist"+id);
        }
        return course;
    }

    @Override
    public void addTeacherToCourse(int teacherId, int courseId) {
        courseRepository.updateTeacherForCourse(teacherId, courseId);
    }

    @Override
    public List<Course> showCourseToTeacher(int teacherId) {
        return courseRepository.showCourseToTeacher(teacherId);
    }

    @Override
    public Integer deleteTeacherIdInCourse(int courseId) {
        courseRepository.deleteTeacherIdInCourse(courseId);
        return null;
    }


}
