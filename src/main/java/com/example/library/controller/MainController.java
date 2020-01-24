package com.example.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.library.domain.User;
import com.google.gson.Gson;

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
		
		User user = new User(1, "Igor", 23, "iwanyshyn@gmail.com", "11111111");    
	    String json = new Gson().toJson(user);
	    model.addAttribute("json", json);
	    
		return "greeting";
	}
}
