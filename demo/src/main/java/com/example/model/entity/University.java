package com.example.model.entity;

import javax.persistence.*;
import java.io.StringWriter;

@Entity
@Table(name = "university")
public class University {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name",nullable = false , length =200)
    private String name;

    @Column(name = "state",nullable = false , length =200)
    private String state;

    @Column(name = "city",nullable = false , length =200)
    private String city;

    public University() {
    }

    public University(int id, String name, String state, String city) {
        this.id = id;
        this.name = name;
        this.state = state;
        this.city = city;
    }

    public University(String name, String state, String city) {
        this.name = name;
        this.state = state;
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}