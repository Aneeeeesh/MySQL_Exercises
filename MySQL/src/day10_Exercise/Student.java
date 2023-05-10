package day10_Exercise;

import java.util.Scanner;

public class Student {

		String name;
		int id;
		Scanner in = new Scanner(System.in);
		
		public Student() {
			System.out.println("Enter student id: ");
			id = in.nextInt();
			System.out.println("Enter name of student: ");
			name = in.next();
		}

}