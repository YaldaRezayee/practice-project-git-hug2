package tiger.api.fakeData.review;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;
import java.util.Date;

public class FakeDataReview {
	
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName()+ faker.name().lastName() + "@gmail.com";
	}
    public static String getName() {
    	Faker faker = new Faker();
    	return faker.name().firstName();
    }
    
    public static String getLastName() {
    	Faker faker = new Faker();
    	return faker.name().lastName();
    }
    
    public static String getTitle() {
    	Faker faker = new Faker();
    	return faker.name().title();
    }
    
    public static String getDob() {
    	Faker faker = new Faker();
    	Date date = faker.date().birthday();
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
    	return dateFormat.format(date);
    }
    
    public static String getPhoneNumber() {
    	Faker faker = new Faker();
    	return faker.phoneNumber().phoneNumber();
    }
    
    public static String getPhoneExtension() {
    	Faker faker = new Faker();
    	return faker.phoneNumber().extension();
    }
    
    public static String getStreetAddress() {
    	Faker faker = new Faker();
    	return faker.address().streetAddress();
    }
    
    public static String getCityName() {
    	Faker faker = new Faker();
    	return faker.address().cityName();
    }
    
    public static String getStateName() {
    	Faker faker = new Faker();
    	return faker.address().state();
    }
    
    public static String getPostalCode() {
    	Faker faker = new Faker();
    	return faker.address().zipCode();
    }
    
    //public static String getCarMake() {
    	//Faker faker = new Faker();
    	//return faker.().streetAddress();
    }

