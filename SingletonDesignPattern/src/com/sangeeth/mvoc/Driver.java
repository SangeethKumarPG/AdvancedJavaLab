package com.sangeeth.mvoc;

public class Driver {

	public static void main(String[] args) {
		SingletonEager singletonEager = SingletonEager.getInstance();
		SingletonLazy singletonLazy = SingletonLazy.getInstance();
		
		//Only one instance is created
		
		System.out.println(SingletonEager.getInstance().hashCode());
		System.out.println(singletonEager.hashCode());
		
		System.out.println(SingletonLazy.getInstance().hashCode());
		System.out.println(singletonLazy.hashCode());
	}
	
}
