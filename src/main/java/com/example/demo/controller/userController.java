package com.example.demo.controller;

import com.example.demo.entity.User;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class userController {

  @GetMapping("/user/hien-thi")
  public String hienthi(Model model) {
    ArrayList<User> list = new ArrayList<>();
    list.add(new User(1, "pham van toan", 25, "Ha Noi"));
    list.add(new User(2, "pham van toan", 22, "Ha Noi"));
    list.add(new User(3, "pham van toan", 21, " Noi"));
    list.add(new User(4, "pham van toan", 22, "Ha Noi"));
    list.add(new User(5, "pham van toan", 12, "Ha "));
    model.addAttribute("listUser", list);
    return "/user.html";
  }

}
