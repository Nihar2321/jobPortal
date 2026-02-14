package com.jobportal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.jobportal.service.ApplicationService;

@Controller
@RequestMapping("/applications")
public class ApplicationController {

    @Autowired
    private ApplicationService applicationService;

    @GetMapping("/approve/{id}")
    public String approve(@PathVariable Long id) {
        applicationService.approveApplication(id);
        return "redirect:/jobs";
    }

    @GetMapping("/reject/{id}")
    public String reject(@PathVariable Long id) {
        applicationService.rejectApplication(id);
        return "redirect:/jobs";
    }
}
