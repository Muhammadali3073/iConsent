import 'package:flutter/material.dart';

mixin MyAppValidations {
  String signupScreenErrorHandler({
    required TextEditingController name,
    required TextEditingController email,
    required TextEditingController setPassword,
    required TextEditingController confirmPassword,
  }) {
    if (name.text.isEmpty) {
      return "Name must not be empty.";
    }
    if (email.text.isEmpty) {
      return "Email must not be empty.";
    }
    if (setPassword.text.isEmpty) {
      return "Set Password must not be empty.";
    }
    if (confirmPassword.text.isEmpty) {
      return "Confirm Password must not be empty.";
    }
    if (!isValidEmail.hasMatch(email.text)) {
      return "Please check your email.";
    }
    if (setPassword.text.length < 8) {
      return "Set Password must be at least 8 characters in length.";
    }
    if (confirmPassword.text.length < 8) {
      return "Confirm Password must be at least 8 characters in length.";
    }
    if (!isValidPassword.hasMatch(setPassword.text)) {
      return "Set Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
    }
    if (!isValidPassword.hasMatch(confirmPassword.text)) {
      return "Confirm Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
    }
    if (setPassword.text != confirmPassword.text) {
      return "Set Passwords do not match.";
    }
    return '';
  }

  String loginScreenErrorHandler({
    required TextEditingController email,
    required TextEditingController password,
  }) {
    if (email.text.isEmpty) {
      return "Email must not be empty.";
    }
    if (password.text.isEmpty) {
      return "Password must not be empty.";
    }
    if (!isValidEmail.hasMatch(email.text)) {
      return "Please check your email.";
    }
    if (password.text.length < 8) {
      return "Password must be at least 8 characters in length.";
    }
    if (!isValidPassword.hasMatch(password.text)) {
      return "Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
    }
    return '';
  }

  String forgotScreenErrorHandler({required TextEditingController email}) {
    if (email.text.isEmpty) {
      return "Email must not be empty.";
    }
    if (!isValidEmail.hasMatch(email.text)) {
      return "Please check your email.";
    }
    return '';
  }

  String otpScreenErrorHandler({required TextEditingController otp}) {
    if (otp.text.isEmpty) {
      return "OTP must not be empty.";
    }
    return '';
  }

  String resetPasswordScreenErrorHandler({
    required TextEditingController newPassword,
    required TextEditingController confirmNewPassword,
  }) {
    if (newPassword.text.isEmpty) {
      return "New Password must not be empty.";
    }
    if (confirmNewPassword.text.isEmpty) {
      return "Confirm New Password must not be empty.";
    }
    if (newPassword.text.length < 8) {
      return "New Password must be at least 8 characters in length.";
    }
    if (confirmNewPassword.text.length < 8) {
      return "Confirm New Password must be at least 8 characters in length.";
    }
    if (!isValidPassword.hasMatch(newPassword.text)) {
      return "New Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
    }
    if (!isValidPassword.hasMatch(confirmNewPassword.text)) {
      return "Confirm New Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
    }
    if (newPassword.text != confirmNewPassword.text) {
      return "New Passwords do not match.";
    }
    return '';
  }
}

final RegExp isValidEmail =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

final RegExp isValidPassword =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$');
