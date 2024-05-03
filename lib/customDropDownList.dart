import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDropDownList<T> extends StatelessWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final T value;   //T is type that could be specified when running the code
  final List<T> items;
  final ValueChanged<T?> onChanged;

  const CustomDropDownList({
    Key? key,
    this.labelText,
    this.prefixIcon,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xff021542),
          fontFamily: "Raleway",
          fontSize: 20,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Color(0xff021542),
        //prefixIconConstraints: const BoxConstraints(maxWidth: 50),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffddf1f9),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffddf1f9),
          ),
        ),
        filled: true, // add this line
        fillColor: Color(0xffddf1f9), // add this line, replace with your desired color
      ),
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
