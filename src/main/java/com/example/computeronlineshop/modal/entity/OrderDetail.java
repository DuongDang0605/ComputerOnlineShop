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
    @Column(name="order_id")
    private Long orderId;
    @Column(name="product_id")
    private Long productId;
    @Column(name="quantity")
    private Long quantity;
    @Column(name="price")
    private Double price;
}
