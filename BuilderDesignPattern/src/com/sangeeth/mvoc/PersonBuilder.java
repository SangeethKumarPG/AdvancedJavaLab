package com.sangeeth.mvoc;

public class PersonBuilder {

	private String firstName;
	private String lastName;
	private int age;
	private long id;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public PersonBuilder firstName(String firstName) {
		this.firstName = firstName;
		return this;
	}
	
	public PersonBuilder lastName(String lastName) {
		this.lastName = lastName;
		return this;
	}
	
	public PersonBuilder age(int age) {
		this.age = age;
		return this;
	}
	
	public PersonBuilder id(long id) {
		this.id = id;
		return this;
	}
	
	public Person build() {
		Person person = new Person();
		person.setFirstName(firstName);
		person.setLastName(lastName);
		person.setId(id);
		person.setAge(age);
		return person;
	}
}
