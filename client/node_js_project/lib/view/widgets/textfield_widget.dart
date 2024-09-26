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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color.fromARGB(77, 84, 78, 78)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.black),
          )),
    );
  }
}
