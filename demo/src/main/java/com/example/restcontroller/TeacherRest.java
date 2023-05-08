package com.example.restcontroller;

import com.example.model.entity.Course;
import com.example.model.entity.Teacher;
import com.example.service.TeacherService;
import com.example.service.TeacherServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/teacher")
public class TeacherRest {

    @Autowired
    TeacherService teacherServiceImp;

    @GetMapping("/list")
    public List<Teacher> list(){
        return teacherServiceImp.getAllTeacher();
    }

    @PostMapping("/add")
    public String insert(@RequestBody Teacher teacher){
        return teacherServiceImp.saveTeacher(teacher);
    }

    @PutMapping("/edit/{id}")
    public Teacher edit(@PathVariable(value = "id")int id){
        Teacher teacher = teacherServiceImp.getTeacherById(id);
        teacherServiceImp.saveTeacher(teacher);
        return teacher;
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable(value = "id")int id){
        return teacherServiceImp.deleteTeacherById(id);
    }

    @PostMapping("/save")
    public String save(@RequestBody Teacher teacher){
        teacherServiceImp.saveTeacher(teacher);
        return "redirect:/university/list";
    }
}
