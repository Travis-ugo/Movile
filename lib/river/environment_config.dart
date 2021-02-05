import 'package:flutter_riverpod/all.dart';

class EnvironmentConfig {
  final movieApiKey = const String.fromEnvironment('movieApiKey');
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
