package com.example.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.library.domain.Role;
import com.example.library.domain.User;
import com.example.library.service.UserService;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class UserController {

	@Autowired
	UserService userService;

	@GetMapping
	public String showAllUsers(Model model) {
		model.addAttribute("users", userService.readAll());

		return "userList";
	}

	@GetMapping("{user}")
	public String userEditForm(@PathVariable User user, Model model) {
		model.addAttribute("userForUpdate", user);
		model.addAttribute("roles", Role.values());

		return "userEdit";
	}

	@PostMapping
	public String userSave(@ModelAttribute("user") User editedUser) {
		editedUser.setActive(true);

		userService.update(editedUser);

		return "redirect:/user";
	}
}
