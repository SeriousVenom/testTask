import 'package:flutter/material.dart';

bool validate = false;

List<String> hintTitles = [
  'Letters only',
  'Password',
  'Date',
  'Numbers only',
];
List<TextEditingController> controllers = List.generate(
  hintTitles.length,
  (index) => TextEditingController(),
);

List<TextInputType> inputTypes = [
  TextInputType.text,
  TextInputType.visiblePassword,
  TextInputType.datetime,
  TextInputType.number,
];
List<FormType> formTypes = [
  FormType.letters,
  FormType.password,
  FormType.date,
  FormType.numbers
];

List<int> calcKeyboard = List.generate(10, (index) => index);

enum FormType { letters, password, date, numbers }

enum CalcOperation { addition, subtraction, multiplication, division }
