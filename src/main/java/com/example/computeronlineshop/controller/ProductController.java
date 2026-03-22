package com.example.computeronlineshop.controller;

import com.example.computeronlineshop.modal.entity.Product;
import com.example.computeronlineshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @GetMapping("/list")
    public ResponseEntity<List<Product>> getList(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String brand,
            @RequestParam(required = false) String type) {
        return ResponseEntity.ok(productService.searchProducts(name, brand, type));
    }
    @GetMapping("/{id}")
    public ResponseEntity<Product> getDetail(@PathVariable Long id) {
        return ResponseEntity.ok(productService.getProductById(id));
    }
}
