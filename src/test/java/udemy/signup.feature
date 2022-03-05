Feature: create new user

	Background: pre conditions
		Given url udemyUrl
	
	Scenario: new user sign up
		Given def userData = {"email":"testrandom126@gmail.com", "username":"testrandom126"}}
		Given path 'users'
			And request 
			"""
			{
	  "user": {
	    "email": "#('Test'+userData.email)",
	    "password": "test123",
	    "username": "#('Test'+userData.username)"
	  	}
		}
		"""
		When method post
		Then status 200
		
		
			
	
	 