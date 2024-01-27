package com.sangeeth.javalist;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ListChallenge {

	public static void main(String[] args) throws IOException {
		BufferedReader bufferReader = new BufferedReader(new InputStreamReader(System.in));
//		System.out.println("Enter the number of elements");
		int size = Integer.parseInt(bufferReader.readLine());
		if (size > 0) {
//			System.out.println("Enter the elements in single line seperated by space");
			String inputString = bufferReader.readLine();
			String[] numbers = inputString.split(" ");
			List<Integer> numbersList = new ArrayList<>();
			for (String string : numbers) {
				numbersList.add(Integer.parseInt(string));
			}
//			System.out.println("Number of queries");
			int numberOfQueries = Integer.parseInt(bufferReader.readLine());
			for (int i = numberOfQueries; i > 0; i--) {
				if (bufferReader.readLine().equalsIgnoreCase("Insert")) {
					String insertString = bufferReader.readLine();
					String[] insertStringArray = insertString.split(" ");
					List<Integer> inputList = new ArrayList<>();
					for (String insert : insertStringArray) {
						inputList.add(Integer.parseInt(insert));
					}
					if (size > inputList.get(0)) {
						numbersList.add(inputList.get(0) - 1, inputList.get(1));
					}
//					else {
//						numbersList.add(inputList.get(1));
//					}
				} else if (bufferReader.readLine().equalsIgnoreCase("Delete")) {
					int deleteIndex = Integer.parseInt(bufferReader.readLine());
					if (numbersList.indexOf(deleteIndex) >= 0) {
						numbersList.remove(deleteIndex);
					}


				}else {
					
				}
			}
			for (Integer integer : numbersList) {
				System.out.print(integer + " ");
			}
		}




		bufferReader.close();
	}

}
