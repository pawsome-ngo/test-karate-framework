function fn() {
  var env = karate.env;
  karate.log('Selected Environment:', env);

  if (!env) {
    env = 'dev';
  }

  karate.log('Post setting the ENV | Selected Environment:', env);

  var configFileName = 'classpath:karate-config-' + env + '.js';

  // 1. Load the external environment configuration (e.g., dev or qa API URL)
  var config = karate.read(configFileName)();

  // =========================================================================
  // 2. NEW LOGIC: Check for local Spring Boot port
  // The Java runner sets 'server.port' if the Spring app is running locally.
  var serverPort = karate.properties['server.port'];

  if (serverPort) {
    // If the port is found, set localBaseUrl to target the Spring app.
    config.localBaseUrl = 'http://localhost:' + serverPort;
    karate.log('Local Spring Boot Server is running at:', config.localBaseUrl);
  } else {
    // If not running locally, default the localBaseUrl to the external one (safe fallback)
    config.localBaseUrl = config.baseUrl;
  }
  // =========================================================================

  config.appVersion = '1.0.0';

  return config;
}