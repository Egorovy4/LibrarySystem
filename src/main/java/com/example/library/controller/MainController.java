package com.example.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	@GetMapping("/")
	public String greeting(Model model) {
		model.addAttribute("name", "World");
		return "greeting";
	}

	@GetMapping("/greeting")
	public String newGreeting(@RequestParam(name = "name", required = false, defaultValue = "DefaultName") String name, Model model) {
		String requestName = name;
		model.addAttribute("name", requestName);
		return "greeting";
	}

	@GetMapping("/main")
	public String test(Model model) {
		return "main";
	}
}
