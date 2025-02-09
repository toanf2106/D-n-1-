package com.example.demo.entity;

import lombok.Data;


@Data

public class User {

  public User() {
  }

  public User(Integer id, String name, Integer age, String address) {
    this.id = id;
    this.name = name;
    this.age = age;
    this.address = address;
  }

  private Integer id;

  private String name;

  private Integer age;

  private String address;
}
