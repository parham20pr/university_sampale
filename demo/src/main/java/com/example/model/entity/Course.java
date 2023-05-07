package com.example.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.Set;

@Entity
@Table(name = "course")
public class Course {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "title",nullable = false,length = 200)
//    @Pattern(regexp = "[a-zA-Z]+{50},")
    private  String title;

    @Column(name = "unit",nullable = false,length = 200)
    private int unit;

    @Column(name = "eventplace",nullable = false,length = 200)
    private String eventplace;


    @ManyToMany(mappedBy = "courses")
    @JsonIgnoreProperties("courses")
    private Set<Student> students;

    @ManyToOne()
    @JoinColumn(name = "teacher_id")
    @JsonIgnoreProperties("courses")
    private Teacher teacher;


    public Course() {
    }

    public Course(int id, String title, int unit, String eventplace, Set<Student> students, Teacher teacher) {
        this.id = id;
        this.title = title;
        this.unit = unit;
        this.eventplace = eventplace;
        this.students = students;
        this.teacher = teacher;
    }

    public Course(String title, int unit, String eventplace, Set<Student> students, Teacher teacher) {
        this.title = title;
        this.unit = unit;
        this.eventplace = eventplace;
        this.students = students;
        this.teacher = teacher;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public String getEventplace() {
        return eventplace;
    }

    public void setEventplace(String eventplace) {
        this.eventplace = eventplace;
    }

    public Set<Student> getStudents() {
        return students;
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
