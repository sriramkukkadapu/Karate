Feature: POST API Feature

#===========> Background
Background:
	* url 'https://gorest.co.in'
	* def random_string =
"""
		function makeid(length) {
		    var result           = '';
		    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		    var charactersLength = characters.length;
		    for ( var i = 0; i < length; i++ ) {
		      result += characters.charAt(Math.floor(Math.random() * 
		 charactersLength));
		   }
		   return result;
		}
"""	
	* def email = random_string(10)+'@gmail.com'
	* print email

#===========> Body	
	* def body =  
	"""{
            "name": "Sriram K",
            "gender": "male",
            "status": "active"
					}
					""" 
	* body.email = email
	* print body
					
Scenario: Create user with given data
Given path '/public/v1/users'
And request body
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.data.id == "#present"
And match $.data.email == body.email


	