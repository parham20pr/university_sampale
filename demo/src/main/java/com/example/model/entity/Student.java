package com.example.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.Set;

@Entity
@Table(name = "student")
public class Student {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "firstname",nullable = false , length =200)
    @Pattern(regexp = "[a-zA-Z]{3,50}",message = "eshtebah dari mizani for firstname ")
    private String firstname;

    @Column(name = "lastname",nullable = false , length =200)
    @Pattern(regexp = "[a-zA-Z]{3,50}",message = "eshtebah dari mizani for lastname ")
    private String lastname;

    @ManyToMany
    @JoinTable(name = "StudentCourse",
                joinColumns =@JoinColumn(name = "Student_id") ,
                inverseJoinColumns = @JoinColumn(name = "Course_id"))
    @JsonIgnoreProperties("students")
    private Set<Course> courses;


    @ManyToOne
    @JoinColumn(name = "university_id",nullable = false)
    @JsonIgnoreProperties("students")
    private University university;


    public Student() {
    }

    public Student(int id, String firstname, String lastname, Set<Course> courses, University university) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.courses = courses;
        this.university = university;
    }

    public Student(String firstname, String lastname, Set<Course> courses, University university) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.courses = courses;
        this.university = university;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }

    public University getUniversity() {
        return university;
    }

    public void setUniversity(University university) {
        this.university = university;
    }
}
