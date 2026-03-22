package com.example.computeronlineshop.repository;

import com.example.computeronlineshop.modal.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p " +
            "JOIN FETCH p.category c " +
            "JOIN FETCH c.brand b " +
            "JOIN FETCH c.component comp " +
            "WHERE (:name IS NULL OR p.productName LIKE %:name%) " +
            "AND (:brandName IS NULL OR b.brandName LIKE %:brandName%) " +
            "AND (:typeName IS NULL OR comp.componentName LIKE %:typeName%) " +
            "AND p.status = 1")
    List<Product> searchProducts(@Param("name") String name,
                                 @Param("brandName") String brandName,
                                 @Param("typeName") String typeName);
}
