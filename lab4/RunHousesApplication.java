import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the HousesApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunHousesApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    		//Register the driver
    		Class.forName("org.postgresql.Driver"); 
    		// Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/chphuynh",
                                                     "chphuynh",
                                                     "datetime32virtual");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the HousesApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
           
             HousesApplication app = new HousesApplication(connection);
             
             /* Testing for getLeaseTenantsWithApartmentsInManyHouses */
             List<Integer> result = app.getLeaseTenantsWithApartmentsInManyHouses(4);
             
             System.out.println("Outputting SSNs of Lease Tenants With Apartments in 4 Houses");
             for(Integer temp : result)
             {
                System.out.println(temp);
             }
             
             /*
             *Output of getLeaseTenantsWithApartmentsInManyHouses
             *when the parameter numberOfHouses is 4.
             709106079
             641078001
             699061306
             */
             
             /* End test for getLeaseTenantsWithApartmentsInManyHouses */
            
             /* Testing for raiseSalary */
             try(Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT name, salary FROM persons WHERE name = 'John Smith'");)
             {
                System.out.println("Outputting before raiseSalary called");
                while(rs.next())
                {
                   System.out.println(rs.getObject(1) + " " + rs.getObject(2));
                }
             } 
             catch(SQLException e)
             {
             }

             app.raiseSalary("John Smith", 10000);

             try(Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT name, salary FROM persons WHERE name = 'John Smith'");)
             {
                System.out.println("Outputting after raiseSalary called");
                while(rs.next())
                {
                   System.out.println(rs.getObject(1) + " " + rs.getObject(2));
                }
             } catch(SQLException e)
             {
             }
             
             /* End test for raiseSalary */
             
             /* Testing for movePersonToApartment */
             System.out.println("First test of movePersonToApartment");
             System.out.println(app.movePersonToApartment(631952071,"401 Heller Drive", 1));
             System.out.println("Second test of movePersonToApartment");
             System.out.println(app.movePersonToApartment(563960185,"401 Heller Drive", 10));
             /* End test for movePersonToApartment */
                    
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
