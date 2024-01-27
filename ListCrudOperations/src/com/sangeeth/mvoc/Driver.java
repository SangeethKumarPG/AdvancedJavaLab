package com.sangeeth.mvoc;

public class Driver {
	
	public static void main(String[] args) {
		ListOperations listOperations = new ListOperations();
		
		listOperations.addToStudentList(new Student("Rahul", "PP", "004", 25));
		listOperations.addToStudentList(new Student("Abhishek", "CS", "002", 25));
		listOperations.addToStudentList(new Student("Abhinav", "VP", "001", 22));
		listOperations.addToStudentList(new Student("Jishnu", "PK", "003", 23));
		listOperations.addToStudentList(new Student("Sangeeth", "PG", "005", 24));
		
		System.out.println("============ALL STUDENTS===============");
		System.out.println(listOperations.getStudents());
		
		System.out.println("=============SORTED STUDENTS===========");
		System.out.println(listOperations.sortStudentsByAge());
		
		System.out.println("=============DELETING STUDENT===========");
		if(listOperations.deleteStudentByRollNumber("005")) {
			System.out.println("Student deleted");
		}else {
			System.out.println("Student not found");
		}
		
		System.out.println("=============UPDATING STUDENT===========");
		if(listOperations.updateStudent("001", new Student("Abhinav", "VP", "001", 21))) {
			System.out.println("Student updated");
		}else {
			System.out.println("Student not found");
		}
		
		System.out.println("============ALL STUDENTS===============");
		System.out.println(listOperations.getStudents());
		
	}

}
