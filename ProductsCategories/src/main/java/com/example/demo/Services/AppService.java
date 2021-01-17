package com.example.demo.Services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.models.*;
import com.example.demo.repositories.*;

@Service
public class AppService {
	private final ProductRepository productRepo;
	private final CategoryRepository categoryRepo;
	public AppService(ProductRepository productRepo, CategoryRepository categoryRepo) {
		this.productRepo = productRepo;
		this.categoryRepo = categoryRepo;
	}
	public Product createProduct(Product product) {
		return productRepo.save(product);
	}
	public Category createCategory(Category category) {
		return categoryRepo.save(category);
	}
	public List<Product> allProducts() {
		return productRepo.findAll();
	}
	public List<Category> allCategories() {
		return categoryRepo.findAll();
	}
	public Product findProduct(Long id) {
		return this.productRepo.findById(id).orElse(null);
	}
	public Category findCategory(Long id) {
		return this.categoryRepo.findById(id).orElse(null);
	}
	public List<Category> findCategoriesNotInProduct(Product product) {
		return categoryRepo.findByProductsNotContains(product);
	}
	public List<Product> findProductsNotInCategory(Category category) {
		return productRepo.findByCategoriesNotContains(category);
	}
	public Product updateProduct(Product product) {
		return productRepo.save(product);
	}
	public Category updateCategory(Category category) {
		return categoryRepo.save(category);
	}
}
