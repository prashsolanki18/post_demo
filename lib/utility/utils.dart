// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// All app level utility methods are defined here
class Utils {
  Utils._();

  /// Hide common snack bar messages
  static void hideMessage() {
    Get.closeCurrentSnackbar();
  }

  /// Show common snack bar messages
  static void showMessage(String title, String message, {snackPosition = SnackPosition.BOTTOM}) {
    Get.closeCurrentSnackbar();
    Get.snackbar(title, message, snackPosition: snackPosition);
  }

  /// Close keyboard
  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
