
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/customFormFeild.dart';
import 'package:optiscan/startTesting.dart';
import 'package:optiscan/customElevatedBottom.dart';


class  signup extends StatefulWidget {
  static const String routeName = "signup";
  const signup ({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();

  var formKey = GlobalKey<FormState>();

  CollectionReference Doctors = FirebaseFirestore.instance.collection('Doctors');

  FirebaseAuth auth = FirebaseAuth.instance;
  String? userEmail;
  DocumentReference? customerRef;

  @override
  void initState() {
    super.initState();
    userEmail = auth.currentUser?.email;
    customerRef = FirebaseFirestore.instance.collection('Doctors').doc(userEmail);
  }


  Future<void> addCustomer() {
    // Call the user's CollectionReference to add a new user
    return Doctors
        .add({
      'first_name' : FirstName.text,
      'last_name' : LastName.text,
      'email' : emailController.text,
      'password' : passwordController.text,
      'country': country.text,
      'city': city.text,
      'reference_email':customerRef
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



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
                    SizedBox(height: 130,),
                    const Text("Create", style:
                    TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542)),),

                    const SizedBox(height: 0.5,),

                    const Text("Account!", style:
                    TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542)),),

                    SizedBox(height: 20,),


                    CustomTextFormField(
                      controller: FirstName,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your First Name";
                        }
                        return null;
                      },
                      labelText: "First name",
                      prefixIcon: Icon(Icons.person),
                    ),

                    SizedBox(height: 20,),

                    CustomTextFormField(
                      controller: LastName,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your Last Name";
                        }
                        return null;
                      },
                      labelText: "Last name",
                      prefixIcon: Icon(Icons.person),
                    ),

                    SizedBox(height: 20,),
                    
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextFormField(
                              controller: country,
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "You must enter your Country";
                                }
                                return null;
                              },
                              labelText: "Country",
                              prefixIcon: Icon(Icons.maps_home_work),
                            ),
                        ),

                        SizedBox(width: 10,),

                        Expanded(
                          child: CustomTextFormField(
                            controller: city,
                            readOnly: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "You must enter your city";
                              }
                              return null;
                            },
                            labelText: "City",
                            prefixIcon: Icon(Icons.home),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),

                    CustomTextFormField(
                      controller: emailController,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your email";
                        }
                        return null;
                      },
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),

                    SizedBox(height: 20,),


                    CustomTextFormField(
                      controller: passwordController,
                      readOnly: true,
                      isPasswordField: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your Password";
                        }
                        return null;
                      },
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
                    ),


                    const SizedBox(height: 60,),


                    Center(
                      child: CustomElevatedButton(
                        text: 'Sign up',
                        onPressed: () async {if(formKey.currentState!.validate()){
                          try {
                            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            addCustomer();
                            Navigator.pushNamed(context, startTesting.routeName);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              //if the password is less than 6 characters
                              print('The password provided is too weak.');
                              final snackBar = SnackBar(content: Text('The password provided is too weak.'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                              final snackBar = SnackBar(content: Text('The account already exists for that email.'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                        },
                        backgroundColor: const Color(0xff021542),
                      )
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

