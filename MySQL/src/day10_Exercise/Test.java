package day10_Exercise;

import java.sql.SQLException;
import java.util.Scanner;

public class Test {

	public static void main(String[] args) {
		
			Scanner sc = new Scanner(System.in);
			SqlCommand command = new SqlCommand();
			
			while (true) {
				
				System.out.println("\n----Menu----"
						+ "\n1. Insert data"
						+ "\n2. Update table"
						+ "\n3. Delete row"
						+ "\n4. Show table"
						+ "\n5. Exit");
	
				String choice = sc.nextLine();
				
				try {
				
					switch(choice){
					
					case "1" :  command.insertData(new Student());
								continue;
								
					case "2" :  System.out.println("\nEnter the row, column of value to be changed: ");
								int row = sc.nextInt();
								int column = sc.nextInt();
								System.out.print("\nEnter new value: ");
								var new_value = sc.next();
								command.updateData(row, column, new_value);
								continue;
								
					case "3" :  System.out.println("\nEnter row to be deleted: ");
								row = sc.nextInt();
								command.deleteRow(row);
								continue;
								
					case "4" :  command.showAll();
								continue;
								
					case "5" :  break;
					
					default  :  continue;
				
					}
					
				}catch(Exception e) {
					System.out.println(e);
					continue;
				}
				
				break;
			}
	}
}