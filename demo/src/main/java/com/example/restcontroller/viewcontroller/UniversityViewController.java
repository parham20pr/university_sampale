package com.example.restcontroller.viewcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/university")
public class UniversityViewController {

    @GetMapping("/list")
    public String view(){
        return "rest/university/restListUniversity";
    }

    @GetMapping("/add")
    public String add(){
        return "rest/university/restAddUniversity";
    }
}
