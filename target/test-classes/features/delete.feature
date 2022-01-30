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
					
Scenario: Delete user with given id
#1 create user using post api
Given path '/public/v1/users'
And request body
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.data.id == "#present"

#2 capture userid from post response
* def userId = $.data.id

#3 delete user 
Given path '/public/v1/users/' + userId
And header Authorization = 'Bearer ' + tokenID
When method delete
Then status 204

#4 get the same user id and check if its deleted
Given path '/public/v1/users/' + userId
And header Authorization = 'Bearer ' + tokenID
When method get
Then status 404
And match $.data.message == "Resource not found"









	