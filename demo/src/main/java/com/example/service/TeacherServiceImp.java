package com.example.service;

import com.example.model.entity.Teacher;
import com.example.model.entity.University;
import com.example.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class TeacherServiceImp implements TeacherService {

    @Autowired
    TeacherRepository teacherRepository;

    @Override
    public List<Teacher> getAllTeacher() {
        return teacherRepository.findAll();
    }

    @Override
    public String saveTeacher(Teacher teacher) {
        teacherRepository.save(teacher);
        return null;
    }

    @Override
    public String deleteTeacherById(int id) {
        teacherRepository.deleteAllById(Collections.singleton(id));
        return null;
    }

    @Override
    public Teacher getTeacherById(int id) {
        Optional<Teacher>teacherOptional = teacherRepository.findById(id);
        Teacher teacher = null;
        if (teacherOptional.isPresent()){
            teacher=teacherOptional.get();
        }else
        {
            throw new RuntimeException("id morde nazare nist"+id);
        }
        return teacher;
    }
}
