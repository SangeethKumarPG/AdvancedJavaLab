package com.sangeeth.mvoc;

public class SingletonLazy {

	private static SingletonLazy singletonLazyInstance = null;
	
	private SingletonLazy() {
		System.out.println("Singleton Lazy Instantiation");
	}
	
	public static SingletonLazy getInstance() {
		if(singletonLazyInstance == null) {
			singletonLazyInstance = new SingletonLazy();
		}
		return singletonLazyInstance;
	}
}
