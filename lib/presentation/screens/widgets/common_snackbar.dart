import 'package:flutter/material.dart';

void showToast(
  BuildContext context,
  String message, {
  bool isError = false,
  int duration = 1,
}) {
  final color = isError ? Colors.red : Colors.green;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
      duration: Duration(seconds: duration),
    ),
  );
}
