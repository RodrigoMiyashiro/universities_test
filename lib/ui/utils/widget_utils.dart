import 'package:flutter/material.dart';

class WidgetUtils {
  static Future<T> showModalUtils<T>(
    BuildContext context,
    Widget child,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: child,
      ),
    );
  }
}
