import 'package:firebase_auth/firebase_auth.dart';
import 'package:optiscan/customFormFeild.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/signup.dart';
import 'package:optiscan/startTesting.dart';
import 'package:optiscan/customElevatedBottom.dart';


class  signin extends StatefulWidget {
  static const String routeName = "signin";
  const signin ({super.key});

  @override
  State<signin> createState() => _signinState();

}

class _signinState extends State<signin> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return  Scaffold(
      body: SafeArea(
        child:
        SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                Image.asset("images/first page.png",
                width: mediaQuery.width,
                height: mediaQuery.height,
                fit: BoxFit.cover,),
                Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 150,),

                    const Text("Welcome", style:
                    TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542)),),

                    const SizedBox(height: 0.5,),


                    const Text("Back!", style:
                    TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542)),),

                    const SizedBox(height: 20,),

                    CustomTextFormField(
                      controller: userController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your email";
                        }
                        return null;
                      },
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                      readOnly: true,
                    ),

                    SizedBox(height: 20,),


                    CustomTextFormField(
                      controller: passwordController,
                      isPasswordField: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
                      readOnly: true,
                    ),

                    const SizedBox(height: 10,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.sendPasswordResetEmail(email: userController.text);
                            },
                            child: const Text("Forgrt your password?",
                                style: TextStyle(
                                    color: Color(0xff021542),
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                        )
                      ],
                    ),


                    const SizedBox(height: 60,),


                    Center(
                      child: CustomElevatedButton(
                        text: 'Sign in',
                        backgroundColor: const Color(0xff021542),
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            try {
                              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: userController.text,
                                  password: passwordController.text
                              );
                              Navigator.pushNamed(context, startTesting.routeName);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                                final snackBar = SnackBar(content: Text('No user found for that email.'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                                final snackBar = SnackBar(content: Text('Wrong password provided for that user.'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            }
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 130,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                              style: TextStyle(
                                    color: Color(0xff021542),
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),

                          TextButton(
                              onPressed: (){Navigator.pushNamed(context, signup.routeName);},
                              child: const Text("Create!",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Raleway",
                                      fontSize: 17)),
                          )
                        ],
                    ),
                  ],
                ),
              )],
            ),
          ),
        ),
        ),
      );
  }

}

