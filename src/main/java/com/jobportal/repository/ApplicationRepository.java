package com.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jobportal.entity.Application;

public interface ApplicationRepository extends JpaRepository<Application, Long> {

    Application findByJobIdAndUserId(Long jobId, Long userId);

    List<Application> findByJobId(Long jobId);
}
