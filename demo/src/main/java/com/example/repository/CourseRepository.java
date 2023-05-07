package com.example.repository;

import com.example.model.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course,Integer> {

    @Transactional
    @Modifying
    @Query(value = "update Course  c set c.teacher.id =:teacherId where c.id=:courseId")
    void updateTeacherForCourse(@Param("teacherId")int teacherId,@Param("courseId")int courseId);



    @Transactional
    @Modifying
    @Query("select c from Course c WHERE c.teacher.id =:teacherId")
    List<Course> showCourseToTeacher(@Param("teacherId") int teacherId);

    @Transactional
    @Modifying
    @Query("update Course c set c.teacher.id = null where c.id=:courseId")
    Integer deleteTeacherIdInCourse(@Param("courseId")int courseId);
}
