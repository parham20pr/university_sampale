package com.example.repository;

import com.example.model.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseRepository extends JpaRepository<Course,Integer> {

    @Modifying
    @Query(value = "update Course  c set Teacher.id=:teacherId where c.id=:courseId",nativeQuery = true)
    String updateTeacherForCourse(@Param("teacherId")int teacherId,@Param("courseId")int courseId);
}
