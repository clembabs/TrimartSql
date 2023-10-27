import 'package:flutter/material.dart';

class InputValidator {
  InputValidator._();

  static String? text(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Field cannot be empty';
    }
    return null;
  }

  static String? number(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Field can not be empty';
    }
    return null;
  }
}

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
