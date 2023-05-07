package com.example.repository;

import com.example.model.entity.Course;
import com.example.model.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer> {

    @Query("select c from Course c join c.students sc where sc.id=?1")
    List<Course>findAllCourseByStudentId(int studentId);
}
