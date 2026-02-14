package com.jobportal.controller;

import com.jobportal.entity.Job;
import com.jobportal.entity.User;
import com.jobportal.service.JobService;
import com.jobportal.service.ApplicationService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/jobs")
public class JobController {

    @Autowired
    private JobService jobService;

    @Autowired
    private ApplicationService applicationService;

    @GetMapping
    public String viewJobs(Model model) {
        model.addAttribute("jobs", jobService.getAllJobs());
        return "jobs/jobList";
    }

    @GetMapping("/new")
    public String showAddJobPage(HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/jobs";
        }

        return "jobs/addJob";
    }

    @PostMapping("/save")
    public String saveJob(@ModelAttribute Job job, HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/jobs";
        }

        jobService.saveJob(job);
        return "redirect:/jobs";
    }

    @GetMapping("/apply/{jobId}")
    public String applyJob(@PathVariable Long jobId, HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null) return "redirect:/login";

        if (!"USER".equalsIgnoreCase(user.getRole()))
            return "redirect:/jobs";

        applicationService.apply(jobId, user.getId());

        return "redirect:/jobs";
    }

    @GetMapping("/applicants/{jobId}")
    public String viewApplicants(@PathVariable Long jobId, Model model) {
        model.addAttribute("applications",
                applicationService.getApplicationsByJobId(jobId));
        return "jobs/applicants";
    }
}
