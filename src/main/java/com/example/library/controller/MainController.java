package com.example.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.library.domain.User;
import com.example.library.service.UserService;
import com.google.gson.Gson;

@Controller
public class MainController {

	@Autowired
	private UserService userService;

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

	@GetMapping("/test")
	public String test(Model model) {
		User user = new User();
		user.setName("test");
		user.setAge(1);
		user.setEmail("test");
		user.setPassword("test");

		System.out.println("CREATING: ");
		System.out.println(userService.create(user));

		System.out.println("READING: ");
		System.out.println(userService.readAll());
		Integer idForReading = userService.readAll().get(0).getId();
		System.out.println(userService.readById(idForReading));

		System.out.println("UPDATING: ");
		Integer idForUpdating = userService.readAll().get(0).getId();
		User userForUpdating = userService.readById(idForUpdating);
		userForUpdating.setName("new");
		userForUpdating.setAge(1000);
		userForUpdating.setEmail("new");
		userForUpdating.setPassword("new");
		System.out.println(userService.updateById(userForUpdating));

		System.out.println("DELETING: ");
		System.out.println(userService.readAll());
		Integer idForDeleting = userService.readAll().get(0).getId();
		userService.deleteById(idForDeleting);

		return "test";
	}
}
