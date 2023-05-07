package com.example.restcontroller;

import com.example.model.entity.Course;
import com.example.model.entity.Teacher;
import com.example.model.entity.University;
import com.example.service.UniversityServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/university")
public class UniversityRest {

    @Autowired
    UniversityServiceImp universityServiceImp;


    @GetMapping("/list")
    public List<University> list(){
        return universityServiceImp.getAllUniversity();
    }

    @PostMapping("/add")
    public String insert(@RequestBody University university){
        return universityServiceImp.saveUniversity(university);
    }

    @PutMapping("/edit/{id}")
    public University edit(@PathVariable(value = "id")int id){
        University university =universityServiceImp.getUniversityById(id);
        universityServiceImp.saveUniversity(university);
        return university;
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable(value = "id")int id){
        return universityServiceImp.deleteUniversityById(id);
    }

    @PostMapping("/save")
    public String save(@RequestBody University university){
        universityServiceImp.saveUniversity(university);
        return "redirect:/university/list";
    }

}
