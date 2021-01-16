package com.example.demo.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.Services.AppService;
import com.example.demo.models.*;

@Controller
public class ProductController {
	private final AppService appService;
	public ProductController(AppService service) {
		this.appService = service;
	}
	@RequestMapping("/products/{id}")
	public String Show(@PathVariable("id") Long id, Model model) {
		model.addAttribute("product", this.appService.findProduct(id));
		model.addAttribute("notInCategories", appService.findCategoriesNotInProduct(this.appService.findProduct(id)));
		return "/product/Show.jsp";
	}
	@RequestMapping(value="/products/{id}/addCat", method=RequestMethod.POST)
	public String addCat(@PathVariable("id") Long id, @Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(result.hasErrors())
			return "/product/Show.jsp";
		Product p = this.appService.findProduct(id);
		p.AddCategory(category);
		return "redirect:/product/"+p.getId();
	}
	@RequestMapping("/products/new")
	public String NewProduct(@ModelAttribute("product") Product product) {
		return "/product/New.jsp";
	}
	@RequestMapping(value="/products", method=RequestMethod.POST)
	public String CreateDojo(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if(result.hasErrors())
			return "/product/New.jsp";
		this.appService.createProduct(product);
		return "redirect:/products/new";
	}
}
