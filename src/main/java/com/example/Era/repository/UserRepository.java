package com.example.Era.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.Era.model.User;


@Repository
public interface UserRepository extends CrudRepository<User, String> {

}
