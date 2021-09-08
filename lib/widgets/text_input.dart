import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final Function onSaved;

  TextInput({
   required this.labelText,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      initialValue: ' ',
      validator: (String? value) {
        if (value!.isEmpty) {
          return '$labelText is required';
        }
        return null;
      },
      onSaved: onSaved as void Function(String?)?,
    );
  }
}
