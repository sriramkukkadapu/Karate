Feature: GET API Feature

Scenario: GET user details
Given header Authorization = 'Bearer 6d3c1e07c99bc7aca4c3916ed5a148aa2174c5fcfe14e8e85069db2a24fcb0d4' 
And header connection = 'keep-alive'
When url baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200



Scenario: GET user details
* def req_headers = {Authorization: 'Bearer 6d3c1e07c99bc7aca4c3916ed5a148aa2174c5fcfe14e8e85069db2a24fcb0d4', connection: 'keep-alive' }  
Given headers req_headers
When url baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200


Scenario: GET user details
* configure headers = {Authorization: 'Bearer 6d3c1e07c99bc7aca4c3916ed5a148aa2174c5fcfe14e8e85069db2a24fcb0d4', connection: 'keep-alive' }  
When url baseUrl+'/public/v1/users'
And path '30'
When method GET
Then status 200