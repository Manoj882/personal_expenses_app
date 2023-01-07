import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({
    required this.handler,
    required this.text,
    super.key});

  final String text;
  final Function handler;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? CupertinoButton(
          onPressed: () => handler,
          child: Text(
            'Choose Date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      : TextButton(
          onPressed: () => handler,
          child: Text(
            'Choose Date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
  }
}