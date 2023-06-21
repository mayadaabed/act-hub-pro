const String basePath = '/api/auth/user';

class RequestConstants {
  static const String login = '$basePath/login';
  static const String register = '$basePath/Register';
  static const String home = '$basePath/home';
  static const String emailVerification = '$basePath/email-verification';
  static const String forgetPasswordRequest = '$basePath/forgot-password';
  static const String resetPassword = '$basePath/reset-password';
  static const String sendOtp = '$basePath/send-email-verification-code';
  static const String fcmTokenUpdate = '$basePath/fcm_token_update';
}
