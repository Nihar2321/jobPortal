package com.jobportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobportal.entity.Application;
import com.jobportal.repository.ApplicationRepository;

@Service
public class ApplicationService {

    @Autowired
    private ApplicationRepository applicationRepository;

    // =========================
    // APPLY FOR JOB
    // =========================
    public void apply(Long jobId, Long userId) {

        Application existing =
                applicationRepository.findByJobIdAndUserId(jobId, userId);

        // If already applied
        if (existing != null) {

            // If rejected → allow reapply
            if ("REJECTED".equalsIgnoreCase(existing.getStatus())) {
                existing.setStatus("PENDING");
                applicationRepository.save(existing);
            }

            // If pending/approved → do nothing
            return;
        }

        // Fresh apply
        Application app = new Application();
        app.setJobId(jobId);
        app.setUserId(userId);
        app.setStatus("PENDING");

        applicationRepository.save(app);
    }

    // =========================
    // GET APPLICANTS OF JOB
    // =========================
    public List<Application> getApplicationsByJobId(Long jobId) {
        return applicationRepository.findByJobId(jobId);
    }

    // =========================
    // APPROVE
    // =========================
    public void approveApplication(Long appId) {
        Application app = applicationRepository.findById(appId).orElse(null);

        if (app != null) {
            app.setStatus("APPROVED");
            applicationRepository.save(app);
        }
    }

    // =========================
    // REJECT
    // =========================
    public void rejectApplication(Long appId) {
        Application app = applicationRepository.findById(appId).orElse(null);

        if (app != null) {
            app.setStatus("REJECTED");
            applicationRepository.save(app);
        }
    }
}
