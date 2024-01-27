package com.sangeeth.mvoc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class ListOperations {

	private List<Student> students = new ArrayList<>();
	Iterator<Student> iterator = students.iterator();

	public boolean addToStudentList(Student student) {
		try {
			students.add(student);
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public List<Student> getStudents() {
		return this.students;
	}

	public Student getStudentByRollNumber(String rollNumber) {
		Student requiredStudent = null;
		while (this.iterator.hasNext()) {
			Student student = iterator.next();
			if (student.getRollNumber().equals(rollNumber)) {
				requiredStudent = student;
			}
		}
		return requiredStudent;

	}

	public List<Student> sortStudentsByAge() {
		Collections.sort(this.students, new StudentComparator());
		return this.students;
	}

	public boolean deleteStudentByRollNumber(String rollNumber) {
		boolean deleteSuccess = false;
		Iterator<Student> studentIterator = this.students.iterator();
		while (studentIterator.hasNext()) {
			Student requiredStudent = studentIterator.next();
			if (requiredStudent.getRollNumber().equals(rollNumber)) {
				studentIterator.remove();
				deleteSuccess = true;
				break;
			}
		}
		return deleteSuccess;
	}

	public boolean updateStudent(String rollNumber, Student student) {
		boolean updateSuccess = false;
		for (int i = 0; i < this.students.size(); i++) {
			Student currentStudent = this.students.get(i);
			if (currentStudent.getRollNumber().equals(rollNumber)) {
				currentStudent.setAge(student.getAge());
				currentStudent.setFirstName(student.getFirstName());
				currentStudent.setRollNumber(student.getRollNumber());
				currentStudent.setLastName(student.getLastName());
				updateSuccess = true;
			}

		}
		return updateSuccess;
	}
}
