package com.jobportal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.jobportal.entity.User;
import com.jobportal.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/home")
    public String home() {
        return "home";
    }
    
    @GetMapping("")
    public String root() {
        return "home";
    }


    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user) {
        user.setRole("USER");
        userService.registerUser(user);
        return "redirect:/login";
    }

    
    @GetMapping("/login")
    public String showLoginPage() {
        return "user/login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password,
                            Model model,
                            HttpSession session) {

        User user = userService.login(email, password);

        if (user != null) {
            session.setAttribute("loggedUser", user);
            return "redirect:/";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "user/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


}
