
import 'package:bank_app/core/environment/env.dart';
import 'main.dart';

void main(List<String> args) {
  Env.environment = Environment.development;
  runProject();
}