package com.example.Era.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Era.model.Customer;
import com.example.Era.repository.CustRepository;

@Service
public class CustService {

	@Autowired
	private CustRepository custRepository;
	
	public List<Customer> findAll()
	{
		List<Customer> custAllList=new ArrayList<Customer>();
		for(Customer cust:custRepository.findAll())
		{
			custAllList.add(cust);
		}
		return custAllList;
	}
	
	public void delCust(Long id) {
		custRepository.deleteById(id);
	}
	
	public void addCust(Customer customer) {	
		custRepository.save(customer);
	}
	
	public Optional<Customer> findCustById(Long id)
	{
		return custRepository.findById(id);
	}
}
