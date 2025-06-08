package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class homeController {

  @GetMapping("home")
  public String index(Model model) {
    System.out.println("Hello World2");
    return "index";
  }

//@GetMapping("/login")
//public String loginForm(){
//    return "/index.html";
//}
//  @PostMapping("/login")
//  public String login
//      (
//          @RequestParam("email") String email,
//          @RequestParam("password") String password,
//          Model model
//      ) {
//    if (email.equals("admin") && password.equals("admin")) {
//      model.addAttribute("message", "Welcome Admin");
//      return "/login.html";
//    } else {
//      model.addAttribute("message", " Admin");
//      return "/login.html";
//    }
//  }

  @GetMapping("/forward")
  public String forward() {
    return "/forward.html";
  }

  @GetMapping("/click")
  public String click(Model model) {
    model.addAttribute("message", "Hello World");
    return "forward:/forward";
  }



@GetMapping("/redirect")
public String redirect(Model model, @RequestParam ("message") String message) {
    model.addAttribute("message", message);
    return "redirect.html";
}

  @GetMapping("/click/redirect")
  public String redirect(RedirectAttributes redirectAttributes) {
    redirectAttributes.addAttribute("message", "abc");
    return "redirect:/redirect";
  }

}
