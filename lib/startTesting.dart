
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:optiscan/Drawer.dart';
import 'package:optiscan/customElevatedBottom.dart';
import 'package:optiscan/signin.dart';
import 'package:optiscan/signup.dart';
import 'package:optiscan/uploadImage.dart';

class  startTesting extends StatefulWidget {
  static const String routeName = "startTesting";
  const startTesting ({super.key});

  @override
  State<startTesting> createState() => _startTestingState();
}

class _startTestingState extends State<startTesting> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const appBar(),
        appBar: AppBar(backgroundColor: Color(0xffcae2ec),),
        body:SafeArea(
          child: Stack(
            children: [
              Image.asset(
                "images/sign.png",
                //media query is used to fit the size on any phone
                width: mediaQuery.width,
                height: mediaQuery.height,
                fit: BoxFit.cover,
              ),

              Positioned(
                top:100,
                right:50,
                child:
                Column(children: [
                  Image.asset(
                    height: 300 ,
                    width: 300,
                    'images/optiscan.png', // Replace 'assets/image.png' with your image path
                    fit: BoxFit.cover,),

                ],),
              ),

              const Positioned(
                top: 430,
                right:15,
                child:
                Column(
                      children: [
                        Row(
                          children: [
                            Text("Early Detection of ",
                              style:
                              TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff021542)),),

                            SizedBox(width: 3,),

                            Text("Gloacoma",
                              style:
                              TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),),
                          ],
                        ),


                        Row(
                          children: [
                            Text("Using",style:
                              TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff021542)),),

                            SizedBox(width: 10,),

                            Text("Deep Learning",style:
                            TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),),
                          ],
                        ),
                      ],
                    ),
              ),

              Positioned(
                bottom: 100,
                right: 15,
                child: CustomElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, uploadImage.routeName);},
                  text:  "Start Testing",
                )
              ),
            ],
          ),
        )
    );
  }
}
