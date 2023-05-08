package com.example.restcontroller.viewcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teacher")
public class TeacherViewController {


    @GetMapping("/list")
    public String view(){
        return "rest/teacher/restListTeacher";
    }

    @GetMapping("/add")
    public String add(){
        return "rest/teacher/restAddTeacher";
    }
}
