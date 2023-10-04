import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;
  const TextComponent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
