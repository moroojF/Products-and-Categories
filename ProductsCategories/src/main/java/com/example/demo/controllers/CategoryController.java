package com.example.demo.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.Services.AppService;
import com.example.demo.models.Category;

@Controller
public class CategoryController {
	private final AppService appService;
	public CategoryController(AppService service) {
		this.appService = service;
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
