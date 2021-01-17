package com.example.demo.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Services.AppService;
import com.example.demo.models.Category;
import com.example.demo.models.Product;

@Controller
public class CategoryController {
	private final AppService appService;
	public CategoryController(AppService service) {
		this.appService = service;
	}
	@RequestMapping("/categories/{id}")
	public String Show(@PathVariable("id") Long id, Model model) {
		model.addAttribute("category", this.appService.findCategory(id));
		model.addAttribute("notInProducts", appService.findProductsNotInCategory(this.appService.findCategory(id)));
		return "/category/Show.jsp";
	}
	@RequestMapping(value="/categories/{id}/addPro", method=RequestMethod.POST)
	public String addPro(@PathVariable("id") Long id,@RequestParam("product") Long product) {
		Category c= this.appService.findCategory(id);
		Product p = this.appService.findProduct(product);
		c.AddProduct(p);
		appService.updateCategory(c);
		return "redirect:/categories/"+c.getId();
	}
	@RequestMapping("/categories/new")
	public String NewCategory(@ModelAttribute("category") Category category) {
		return "/category/New.jsp";
	}
	@RequestMapping(value="/categories", method=RequestMethod.POST)
	public String CreateCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(result.hasErrors())
			return "/category/New.jsp";
		this.appService.createCategory(category);
		return "redirect:/categories/new";
	}
}
