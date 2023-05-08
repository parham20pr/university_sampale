package com.example.service;

import com.example.model.entity.University;
import com.example.repository.UniversityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class UniversityServiceImp implements UniversityService{


    @Autowired
    UniversityRepository universityRepository;
    @Override
    public List<University> getAllUniversity() {
        return universityRepository.findAll() ;
    }

    @Override
    public String saveUniversity(University university) {
        universityRepository.save(university);
        return null;
    }

    @Override
    public String deleteUniversityById(int id) {
        universityRepository.deleteAllById(Collections.singleton(id));
        return null;
    }

    @Override
    public University getUniversityById(int id) {
        Optional<University> university=universityRepository.findById(id);
        University university1= null;
        if (university.isPresent()){
            university1=university.get();
        }else
        {
            throw new RuntimeException("id morde nazare nist"+id);
        }
        return university1;
    }
}
