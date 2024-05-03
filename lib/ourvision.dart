
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:optiscan/startTesting.dart';

class  ourvision extends StatefulWidget {
  static const String routeName = "ourvision";
  const ourvision ({super.key});

  @override
  State<ourvision> createState() => _ourvisionState();
}

class _ourvisionState extends State<ourvision> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body:SafeArea(
          child: Stack(
            children: [
              Image.asset(
                "images/first page.png",
                //media query is used to fit the size on any phone
                width: mediaQuery.width,
                height: mediaQuery.height,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 20,
                child: IconButton(onPressed: (){Navigator.pushNamed(context, startTesting.routeName);},
                    icon: const Icon(Icons.arrow_back,
                        size: 30,
                        color: Color(0xff021542))),
              ),

              Positioned(
                top: 30,
                left: 60,
                child:
                Image.asset('images/optiscan.png',height:300,width: 300,),),

               const Positioned(
                 top: 320,
                 left: 30,
                 child: Column(
                   children: [
                     Text(
                        "Our Vision",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Raleway"
                        ),
                      ),
                     SizedBox(height: 30,),

                     Text(
                       "Providing Gluacoma Detection System",
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: Color(0xff021542),
                         fontFamily: "Raleway",
                       ),
                     ),

                     Text(
                       "that has the following features:",
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: Color(0xff021542),
                           fontFamily: "Raleway"
                       ),
                     ),

                     SizedBox(height: 20,),
                   ],
                 ),
               ),

              const Positioned(
                top: 500,
                right: 25,
                child:
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1- Time Saving.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542),
                        fontFamily: "Raleway"
                    ),
                  ),
                  SizedBox(height: 10,),

                  Text(
                    "2- Highly accutare and reliable.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542),
                        fontFamily: "Raleway"
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text(
                    "3- Effortless for patients and doctors.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542),
                        fontFamily: "Raleway"
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text(
                    "4- A user-friendly tool.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542),
                        fontFamily: "Raleway"
                    ),
                  ),
                ]
              ),
              )
            ]
          ),
        )
    );
  }
}
