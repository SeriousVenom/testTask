import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:test_task/UI/data.dart';

class FormWidget extends StatefulWidget {
  const FormWidget(
      {super.key,
      required this.hintTitle,
      required this.inputType,
      this.formType,
      required this.controller,
      this.validate,
      this.color,
      this.onPressed});

  final String hintTitle;
  final TextInputType inputType;
  final TextEditingController controller;
  final FormType? formType;
  final bool? validate;
  final Color? color;
  final void Function(String)? onPressed;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0)),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        style: TextStyle(color: widget.color ?? Colors.black),
        inputFormatters: <TextInputFormatter>[
          if (widget.formType == FormType.letters ||
              widget.formType == FormType.numbers)
            FilteringTextInputFormatter.allow(
                RegExp(widget.formType == FormType.letters
                    ? "[a-zA-Zа-яА-Я]"
                    : widget.formType == FormType.numbers
                        ? "[0-9]"
                        : "")),
        ],
        onChanged: (value) {
          setState(() {
            widget.controller.text = value;
          });
        },
        onFieldSubmitted: widget.onPressed,
        obscureText: widget.formType == FormType.password ? true : false,
        decoration: InputDecoration(
          errorText: widget.validate ?? false
              ? widget.controller.text.isEmpty
                  ? 'Field Can\'t Be Empty'
                  : null
              : null,
          suffixIcon: widget.validate ?? false
              ? widget.controller.text.isEmpty
                  ? Icon(
                      Icons.warning,
                      color: Colors.red.shade900,
                    )
                  : null
              : null,
          suffixIconConstraints:
              const BoxConstraints(maxWidth: 64.0, minWidth: 64.0),
          hintText: widget.hintTitle,
          hintStyle: TextStyle(color: widget.color ?? Colors.black),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        readOnly: widget.formType == FormType.date ? true : false,
        onTap: () async {
          if (widget.formType == FormType.date) {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ).then((selectedDate) {
              if (selectedDate != null) {
                setState(() {
                  widget.controller.text =
                      DateFormat('dd.MM.yyyy').format(selectedDate);
                });
              }
            });
          }
        },
      ),
    );
  }
}
