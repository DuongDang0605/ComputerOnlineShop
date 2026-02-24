package com.example.computeronlineshop.modal.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="order_detail")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="order_id", nullable=false,referencedColumnName = "id")
    private Order order;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="product_id", nullable=false)
    private Product product;

    @Column(name="quantity")
    private Integer quantity;
    @Column(name="price")
    private Double price;
}
