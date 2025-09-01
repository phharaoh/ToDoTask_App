import 'package:flutter/material.dart';

abstract class TextForm {
  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(),
  );

  static InputDecoration inputDecoration = InputDecoration(
    enabledBorder: TextForm.outlineInputBorder,
    filled: true,
    fillColor: Colors.white,
    border: TextForm.outlineInputBorder,
  );
}
