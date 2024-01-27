package com.sangeeth.mvoc;

public class SingletonEager {
	
	private static SingletonEager singletonEagerInstance = new SingletonEager();
	
	private SingletonEager() {
		System.out.println("Eager singleton instantiation");
	}
	
	public static SingletonEager getInstance() {
		return singletonEagerInstance;
	}

}
