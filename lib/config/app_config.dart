enum Environment {
  staging,
  production,
}

class AppConfig {
  static Environment? _environment;
  
  static Environment get environment => _environment ?? Environment.production;
  
  static void setEnvironment(Environment env) {
    _environment = env;
  }
  
  static String get appName {
    switch (environment) {
      case Environment.staging:
        return 'Travelet - Staging';
      case Environment.production:
        return 'Travelet';
    }
  }
  
  static String get apiBaseUrl {
    switch (environment) {
      case Environment.staging:
        return 'https://asia-northeast1-travelet-flutter.cloudfunctions.net/api-staging';
      case Environment.production:
        return 'https://asia-northeast1-travelet-flutter.cloudfunctions.net/api';
    }
  }
  
  static String get firebaseProjectId => 'travelet-flutter';
  
  static bool get isDebugMode {
    switch (environment) {
      case Environment.staging:
        return true;
      case Environment.production:
        return false;
    }
  }
  
  static String get webUrl {
    switch (environment) {
      case Environment.staging:
        return 'https://travelet-flutter-staging.web.app';
      case Environment.production:
        return 'https://travelet-flutter.web.app';
    }
  }
}