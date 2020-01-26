package com.example.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.library.dao.UserRepository;
import com.example.library.domain.User;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User create(User user) {
		return userRepository.saveAndFlush(user);
	}

	public User readById(Integer id) {
		return userRepository.findById(id).get();
	}

	public List<User> readAll() {
		return userRepository.findAll();
	}

	public User updateById(User user) {
		return userRepository.save(user);
	}

	public void deleteById(Integer id) {
		userRepository.deleteById(id);
	}
}
