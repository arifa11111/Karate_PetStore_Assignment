function fn() {
  var env = karate.env; // get system property 'karate.env'

  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    baseUrl: 'https://petstore.swagger.io/v2',
    newPwd: 'Petstore@123'
  }

  if (env == 'dev') {}
  else if (env == 'e2e') {}

  var result = karate.callSingle('classpath:com/karate/petstore/createPetStore.feature', config);
  config.petId = result.id;

  var result = karate.callSingle('classpath:com/karate/store/createStore.feature', config);
  config.storeId = result.id;

  return config;
}