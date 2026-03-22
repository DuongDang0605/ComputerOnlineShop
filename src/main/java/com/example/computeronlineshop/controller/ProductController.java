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
    public ResponseEntity<List<Product>> listProduct(@RequestParam(required = false) String key) {
        return ResponseEntity.ok(productService.listProducts(key));
    }
    @GetMapping("/{id}")
    public ResponseEntity<Product> productDetail(@PathVariable Long id) {
        return ResponseEntity.ok(productService.getProductById(id));
    }
}
