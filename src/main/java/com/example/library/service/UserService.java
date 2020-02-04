package com.example.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.library.dao.UserRepository;
import com.example.library.domain.User;

@Service
public class UserService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	public User create(User user) {
		return userRepository.save(user);
	}

	public User readById(Integer id) {
		return userRepository.findById(id).get();
	}

	public List<User> readAll() {
		return userRepository.findAll();
	}

	public User update(User user) {
		return userRepository.save(user);
	}

	public void deleteById(Integer id) {
		userRepository.deleteById(id);
	}

	public User readByUsername(String username) {
		return userRepository.readByUsername(username);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return userRepository.readByUsername(username);
	}
}
