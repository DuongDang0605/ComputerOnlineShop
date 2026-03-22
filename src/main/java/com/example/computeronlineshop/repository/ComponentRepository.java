package com.example.computeronlineshop.repository;

import com.example.computeronlineshop.modal.entity.Component;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ComponentRepository extends JpaRepository<Component, Long> {
}
