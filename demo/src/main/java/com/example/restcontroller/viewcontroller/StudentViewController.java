package com.example.restcontroller.viewcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentViewController {

    @GetMapping("/list")
    public String view(){
        return "rest/student/restListStudent";
    }

    @GetMapping("/add")
    public String add(){
        return "rest/student/restAddStudent";
    }
}
