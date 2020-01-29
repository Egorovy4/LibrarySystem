package com.example.library.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.library.domain.Role;
import com.example.library.domain.User;
import com.example.library.service.UserService;

@Controller
public class RegistrationController {

	@Autowired
	private UserService userService;

	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}

	@PostMapping("/registration")
	public String registration(User user, Map<String, Object> model) {
		User userFromDb = userService.readByUsername(user.getUsername());

		if (userFromDb != null) {
			model.put("message", "User exists!");
			return "registration";
		}

		user.setActive(true);
		user.setRoles(Collections.singleton(Role.USER));
		userService.create(user);

		return "redirect:/login";
	}
}
