package com.sangeeth.mvoc;

public class Driver {

	public static void main(String[] args) {
		Person person = new PersonBuilder()
				.firstName("SangeethKumar")
				.age(24)
				.lastName("PG")
				.id(1)
				.build();
		
		System.out.println("Name : "+person.getFirstName()+person.getLastName());
		System.out.println("Age : "+person.getAge());
		System.out.println("Id : "+person.getId());
	}
}
