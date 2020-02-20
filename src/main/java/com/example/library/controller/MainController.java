package com.example.library.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.library.domain.Note;
import com.example.library.domain.User;
import com.example.library.service.NoteService;

@Controller
public class MainController {

	@Autowired
	NoteService noteService;
	
	// write value of upload.path from file application.properties to uploadPath 
	@Value("${upload.path}")
	private String uploadPath;
	
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
	public String showAllNotes(
			@RequestParam(required = false, defaultValue = "") String filter, 
			Model model
	) {
		List<Note> allNotes;
		
		if(filter != null && !filter.isEmpty()) {
			allNotes = noteService.readByHeader(filter);
		} else {
			allNotes = noteService.readAll();
		}
		
		model.addAttribute("allNotes", allNotes);
		model.addAttribute("filter", filter);
		
		return "main";
	}
	
	@PostMapping("/addNote")
	public String addNote(
			@AuthenticationPrincipal User user,
			@RequestParam String header,
			@RequestParam String text,
			@RequestParam("file") MultipartFile file
	) throws IllegalStateException, IOException {
		Note note = new Note(header, text, user);

		if (file != null && !file.getOriginalFilename().isEmpty()) {
			File uploadDir = new File(uploadPath);

			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			String uuidFile = UUID.randomUUID().toString();
			String resultFilename = uuidFile + "." + file.getOriginalFilename();

			file.transferTo(new File(uploadPath + "/" + resultFilename));

			note.setFilename(resultFilename);
		}

		noteService.create(note);
		
		return "redirect:/main";
	}
}
