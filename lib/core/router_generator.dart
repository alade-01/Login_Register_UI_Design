import 'package:flutter/material.dart';
import 'package:login_register_ui_design/windows/login_screen.dart';
import 'package:login_register_ui_design/windows/otp_screen.dart';
import 'package:login_register_ui_design/windows/register_screen.dart';
import 'package:login_register_ui_design/windows/welcome_screen.dart';

import '../windows/forgot_password_screen.dart';
import '../windows/new_password_screen.dart';
import '../windows/password_changed_screen.dart';
import '../windows/splash_screen.dart';
import '../windows/onboarding_screen.dart';

class RouterGenerator {
  static const splashRoute = "/";
  static const introRoute = "/intro";
  static const loginRoute = "/login";
  static const registerRoute = "/register";
  static const forgotPasswordRoute = "/forgot-password";
  static const otpRoute = "/otp";
  static const newPasswordRoute = "/new-password";
  static const passwordChangedRoute = "/password-changed";
  static const welcomeRoute = "/welcome";

  // static const indexRoute = "/index";

  static Route<dynamic> navigate(RouteSettings setting) {
    debugPrint("$setting");
    switch (setting.name) {
      case RouterGenerator.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouterGenerator.introRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case RouterGenerator.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RouterGenerator.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case RouterGenerator.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
        case RouterGenerator.otpRoute:
        return MaterialPageRoute(
          builder: (_) => const OtpsScreen(),
        );
      case RouterGenerator.newPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const NewPasswordScreen(),
        );
      case RouterGenerator.passwordChangedRoute:
        return MaterialPageRoute(
          builder: (_) => const PasswordChangedScreen(),
        );
        case RouterGenerator.welcomeRoute:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
