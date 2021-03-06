package com.example.library.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.library.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	User readByUsername(String username);
}
