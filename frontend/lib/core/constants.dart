import "package:flutter/foundation.dart";

class AppConstants {
  AppConstants._();

  static const int backendPort = 8080;

  // Set true for local backend without TLS.
  static const bool useInsecureGrpcForLocal = true;

  static const int maxTransientRetries = 3;
  static const Duration retryBackoff = Duration(seconds: 2);

  static String get backendHost {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return "10.0.2.2";
    }
    return "localhost";
  }
}
