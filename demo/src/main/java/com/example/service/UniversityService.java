package com.example.service;

import com.example.model.entity.Teacher;
import com.example.model.entity.University;

import java.util.List;

public interface UniversityService {

    List<University> getAllUniversity();

    String saveUniversity(University university);

    String deleteUniversityById(int id);

    University getUniversityById(int id);
}
