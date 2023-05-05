package com.example.restcontroller;

import com.example.model.entity.Course;
import com.example.model.entity.Student;
import com.example.service.StudentServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/student")
public class StudentRest {

    @Autowired
    StudentServiceImp studentServiceImp;

    @GetMapping("/list")
    public List<Student> list(){
        return studentServiceImp.getAllStudent();
    }

    @PostMapping("/add")
    public String insert(@RequestBody Student student){
        return studentServiceImp.saveStudent(student);
    }

    @PutMapping("/edit/{id}")
    public Student edit(@PathVariable(value = "id")int id){
        Student student =studentServiceImp.getStudentById(id);
        studentServiceImp.saveStudent(student);
        return  student;
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable(value = "id")int id){
        return studentServiceImp.deleteStudentById(id);
    }

    @PostMapping("/save")
    public String save(@RequestBody Student student){
        studentServiceImp.saveStudent(student);
        return "redirect:/university/list";
    }

    @GetMapping("/addcourse/{idstudent}/{idcourse}")
    public String addStudentToCourse(@PathVariable int idstudent,@PathVariable int idcourse){
        return studentServiceImp.addCourseToStudent(idstudent,idcourse);
    }

    @GetMapping("/showdetail/{idstudent}")
    public List<Course> showDetialCourse(@PathVariable int idstudent){
        return studentServiceImp.getCourseByStudentId(idstudent);
    }
}
