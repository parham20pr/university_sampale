package com.example.service;

import com.example.model.entity.Course;
import com.example.model.entity.Student;
import com.example.repository.CourseRepository;
import com.example.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class StudentServiceImp implements StudentService {

    @Autowired
    StudentRepository studentRepository;

    @Autowired
    CourseService courseService;

    @Override
    public List<Student> getAllStudent() {
        return studentRepository.findAll();
    }

    @Override
    public String saveStudent(Student student) {
         studentRepository.save(student);
        return null;
    }

    @Override
    public String deleteStudentById(int id) {
        studentRepository.deleteAllById(Collections.singleton(id));
        return null;
    }

    @Override
    public Student getStudentById(int id) {
        Optional<Student>studentOptional = studentRepository.findById(id);
        Student student=null;
        if (studentOptional.isPresent()){
            student=studentOptional.get();
        }else
        {
            throw new RuntimeException("id morde nazare nist"+id);
        }
        return student;
    }

    @Override
    public String addCourseToStudent(int studentId, int courseId) {
        Student student=getStudentById(studentId);
        Course course =courseService.getCourseById(courseId);
        Set<Course>courseSet=student.getCourses();
        courseSet.add(course);
        student.setCourses(courseSet);
        return saveStudent(student);
    }

    @Override
    public List<Course> getCourseByStudentId(int studentId) {
        return studentRepository.findAllCourseByStudentId(studentId);
    }

    @Override
    @Transactional
    public String deleteCourseById(int studentId, int courseId) {
        Optional<Student>optionalStudent=studentRepository.findById(studentId);
        if (optionalStudent.isPresent()){
            Student student = optionalStudent.get();
            Course course=courseService.getCourseById(courseId);
            student.getCourses().remove(course);
            studentRepository.save(student);
        }
        return null;
    }
}
