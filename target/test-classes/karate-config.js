function fn() { 
var env = karate.env; // get system property 'karate.env' 
karate.log('karate.env system property was:', env); 
if (!env) { 
env = 'dev'; 
} 
var config = { 
//env: env, 
myVarName: 'hello karate', 
baseUrl: 'https://gorest.co.in',
tokenID: '6d3c1e07c99bc7aca4c3916ed5a148aa2174c5fcfe14e8e85069db2a24fcb0d4',
udemyUrl: 'https://api.realworld.io/api/'
}
if (env == 'dev') { 
// customize 
// e.g. config.foo = 'bar'; 
config.userEmail = 'sriramkukkadapu@gmail.com'
config.userPassword = 'sriramk1'
 
} else if (env == 'qa') { 
// customize 
config.userEmail = 'invalid@gmail.com'
config.userPassword = 'invalid'
} 

var accessToken = karate.callSingle('classpath:helpers/CreateTokenConfigVariables.feature',config).token
karate.configure('headers', {Authorization: 'Token '+ accessToken})

return config; 
}