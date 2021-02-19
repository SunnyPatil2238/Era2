package com.example.Era.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.Era.model.Customer;

@Repository
public interface CustRepository extends CrudRepository<Customer, Long> {

}
