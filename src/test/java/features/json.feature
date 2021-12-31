Feature: Print hello world feature

# ============ Scenario 1 ==============
Scenario: Hello world scenario 
	
	* print 'hello world'
	* print 'hello sriram kukkadapu'

# ============ Scenario 2 ==============	
Scenario: declare and print variables

	* def balance = 200
	* def pi = 3.14
	* print 'total = ' + balance * pi 	