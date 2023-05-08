package com.example.restcontroller.viewcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/course")
public class CourseViewController {

    @GetMapping("/list")
    public String view(){
        return "rest/course/restListCourse";
    }

    @GetMapping("/add")
    public String add(){
        return "rest/course/restAddCourse";
    }
}
