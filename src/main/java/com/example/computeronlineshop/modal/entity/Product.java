package com.example.computeronlineshop.modal.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import java.time.LocalDateTime;

@Entity
@Table(name = "product")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name")
    private String productName;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;
    @Column(name = "quantity")
    private Integer quantity;
    @Column(name = "price")
    private Double price;
    @Column(name = "image")
    private String imageUrl;
    @Column(name="created_at")
    private LocalDateTime createdAt;

    @Column(name="updated_at")
    private LocalDateTime updatedAt;

    @Column(name="created_by")
    private String createdBy;

    @Column(name="updated_by")
    private String updatedBy;

    @Column(name="status")
    private Long status;


}
