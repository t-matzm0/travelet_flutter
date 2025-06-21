import 'config/app_config.dart';
import 'main.dart' as main_app;

void main() {
  AppConfig.setEnvironment(Environment.production);
  main_app.main();
}