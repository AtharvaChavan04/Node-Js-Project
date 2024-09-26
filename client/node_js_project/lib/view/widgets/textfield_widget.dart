import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  const TextfieldWidget({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.text,
        ));
  }
}
