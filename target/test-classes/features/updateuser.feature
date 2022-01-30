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
	* def body_post =  
	"""{
            "name": "Sriram K",
            "gender": "male",
            "status": "active"
					}
					""" 
	* body_post.email = email
	* print body_post
					
					
Scenario: Update user with given data
Given path '/public/v1/users'
And request body_post
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.data.id == "#present"


#fetch id from post call response.
* def userId = $.data.id
* print userId

#put call to update the user
	* def body_put =  
	"""{
						"gender" : "female",
            "status": "inactive"
		 }"""
					
Given path '/public/v1/users/' +  userId
And request body_put
And header Authorization = 'Bearer ' + tokenID
When method put
Then status 200
And match $.data.id == "#present"
And match $.data.id == userId
And match $.data.name == "#present"
And match $.data.name == "Sriram K"
And match $.data.email == body_post.email






	