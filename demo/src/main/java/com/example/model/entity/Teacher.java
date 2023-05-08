package com.example.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "teacher")
public class Teacher {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "firstname",nullable = false , length =200)
    private String firstname;

    @Column(name = "lastname",nullable = false , length =200)
    private String lastname;

    public Teacher() {
    }

    public Teacher(int id, String firstname, String lastname) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public Teacher(String firstname, String lastname) {
        this.firstname = firstname;
        this.lastname = lastname;
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
}
