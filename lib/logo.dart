import 'dart:async';
import 'package:flutter/material.dart';
import 'package:optiscan/home page.dart';


class logoScreen extends StatefulWidget {
  static const String routeName = "logoPage";

  const logoScreen({super.key});

  @override
  State<logoScreen> createState() => _logoScreenState();
}

class _logoScreenState extends State<logoScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, homepage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/logo.png",
            width: mediaQuery.width,
            height: mediaQuery.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset("images/optiscan.png"),
          )
        ],
      ),
    );
  }
}
