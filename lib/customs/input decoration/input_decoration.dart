import 'package:flutter/material.dart';

OutlineInputBorder border({Color color = Colors.white}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(width: 2, color: color),
  );
}

InputDecoration inputDecoration({String? hintText, Icon? prefixIcon}) {
  return InputDecoration(
      border: border(),
      errorBorder: border(),
      enabledBorder: border(),
      focusedBorder: border(),
      focusedErrorBorder: border(),
      isDense: true,
      prefixIcon: prefixIcon,
      labelText: hintText,
      constraints: const BoxConstraints.tightFor(width: 300),
      hintText: hintText);
}
