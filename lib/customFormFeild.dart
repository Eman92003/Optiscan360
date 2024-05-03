import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool isPasswordField;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.readOnly = false,
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscured = false;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: isObscured,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
            color: Color(0xff021542),
            fontSize: 17,
            fontFamily: "Raleway"
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: Color(0xff021542),
        suffixIcon: widget.isPasswordField ? IconButton(
          icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
        ) : null,
        suffixIconColor: Color(0xff021542),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffddf1f9),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffddf1f9)),
        ),
        filled: true,
        fillColor: Color(0xffddf1f9),
      ),
      onTap: !widget.readOnly ? () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2023),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          widget.controller.text = formattedDate;
        }
      } : null,
    );
  }
}
