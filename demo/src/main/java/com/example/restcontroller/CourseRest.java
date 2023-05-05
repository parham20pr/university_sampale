package com.example.restcontroller;

import com.example.model.entity.Course;
import com.example.repository.CourseRepository;
import com.example.service.CourseServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/course")
public class CourseRest {

    @Autowired
    CourseServiceImp courseServiceImp;

    @Autowired
    CourseRepository courseRepository;

    @GetMapping("/list")
    public List<Course>list(){
        return courseServiceImp.getAllCourse();
    }

    @PostMapping("/add")
    public String insert(@RequestBody Course course){
        return courseServiceImp.saveCourse(course);
    }

    @PutMapping("/edit/{id}")
    public Course edit(@PathVariable(value = "id")int id){
        Course course = courseServiceImp.getCourseById(id);
        return course;
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable(value = "id")int id){
        return courseServiceImp.deleteCourseById(id);
    }

    @PostMapping("/save")
    public String save(@RequestBody Course course){
        courseServiceImp.saveCourse(course);
        return "redirect:/university/list";
    }

    @PostMapping("/updateteacher/{idteacher}/{idcourse}")
    public String addTeacherToCourse(@PathVariable int idteacher,@PathVariable int idcourse){
       return courseRepository.updateTeacherForCourse(idteacher, idcourse);
    }
}
