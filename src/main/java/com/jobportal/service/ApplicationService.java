package com.jobportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jobportal.entity.Application;
import com.jobportal.repository.ApplicationRepository;
import java.util.List;


@Service
public class ApplicationService {

    @Autowired
    private ApplicationRepository repo;

    public void apply(Long jobId, Long userId) {
        Application app = new Application();
        app.setJobId(jobId);
        app.setUserId(userId);
        repo.save(app);
    }
    
    public List<Application> getApplicationsByJobId(Long jobId) {
        return repo.findByJobId(jobId);
    }

}
