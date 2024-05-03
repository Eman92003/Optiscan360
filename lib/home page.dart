import 'package:flutter/material.dart';
import 'package:optiscan/customElevatedBottom.dart';
import 'package:optiscan/signin.dart';
import 'package:optiscan/signup.dart';

class  homepage extends StatefulWidget {
  static const String routeName = "homePage";
  const homepage ({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
                    top: 50,
                    left: 10,
                    child:
                    Image.asset('images/optiscan.png',height:400,width: 400,),),


                Positioned(
                  bottom: 300,
                  right: 30,
                  child:CustomElevatedButton(
                    text: "Sign in",
                    onPressed:(){
                      Navigator.pushNamed(context, signin.routeName);
                    } ,
                  )
                ),

                Positioned(
                  bottom: 200,
                  right: 30,
                  child:
                  CustomElevatedButton(
                    text: "Sign up",
                    onPressed:(){
                      Navigator.pushNamed(context, signup.routeName);
                    } ,
                  )
                ),

              ],
            ),
        ));
  }
}
