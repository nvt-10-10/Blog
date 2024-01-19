package com.example.demo;

import com.example.demo.model.entity.User;
import com.example.demo.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

@SpringBootTest
class Demo1ApplicationTests {
@Autowired private UserService repo;
	@Test
	void contextLoads()  throws ParseException{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

		try {
			Date birthDate1 = dateFormat.parse("01-01-1990");
			Date birthDate2 = dateFormat.parse("15-07-1985");
			Date birthDate3 = dateFormat.parse("10-03-1992");
			Date birthDate4 = dateFormat.parse("22-11-1988");
			Date birthDate5 = dateFormat.parse("05-06-1995");
			Date birthDate6 = dateFormat.parse("18-09-1983");
			Date birthDate7 = dateFormat.parse("30-04-1998");
			Date birthDate8 = dateFormat.parse("12-08-1980");
			Date birthDate9 = dateFormat.parse("25-12-1993");
			Date birthDate10 = dateFormat.parse("08-07-1987");

//			User user1 = new User(0,"john_doe", "password1", "John Doe", "john@example.com", "123 Main St", birthDate1);
//			User user2 = new User(0,"jane_smith", "password2", "Jane Smith", "jane@example.com", "456 Oak St", birthDate2);
//			User user3 = new User(0,"alice_green", "password3", "Alice Green", "alice@example.com", "789 Maple St", birthDate3);
//			User user4 = new User(0,"bob_jones", "password4", "Bob Jones", "bob@example.com", "567 Pine St", birthDate4);
//			User user5 = new User(0,"sara_wilson", "password5", "Sara Wilson", "sara@example.com", "890 Cedar St", birthDate5);
//			User user6 = new User(0,"michael_brown", "password6", "Michael Brown", "michael@example.com", "234 Elm St", birthDate6);
//			User user7 = new User(0,"emily_taylor", "password7", "Emily Taylor", "emily@example.com", "876 Birch St", birthDate7);
//			User user8 = new User(0,"ryan_miller", "password8", "Ryan Miller", "ryan@example.com", "543 Walnut St", birthDate8);
//			User user9 = new User(0,"laura_white", "password9", "Laura White", "laura@example.com", "678 Fir St", birthDate9);
//			User user10 = new User(0,"david_smith", "password10", "David Smith", "david@example.com", "901 Oak St", birthDate10);

//			repo.saveAll(Arrays.asList(user1, user2, user3, user4, user5, user6, user7, user8, user9, user10));

		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

}
