import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:optiscan/startTesting.dart';



class doctorInfo extends StatefulWidget {
  static const String routeName = "doctorInfo";
  const doctorInfo ({super.key});

  @override
  State<doctorInfo> createState() => _doctorInfoState();
}

class _doctorInfoState extends State<doctorInfo> {
  var formKey = GlobalKey<FormState>();

  List <QueryDocumentSnapshot> Patients = [];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Patients').get();
    Patients.addAll(querySnapshot.docs);
    setState(() {

    });
  }

  String FirstName = '';
  String LastName = '';


  Future<void> fetchCustomerData() async {
    try {
      FirebaseFirestore.instance
          .collection('Doctors')
          .where('reference_email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          FirstName = doc['first_name'];
          LastName = doc['last_name'];
        });
      });
    } catch (e) {
      print("An error occurred while fetching customer data: $e");
    }
  }


  @override
  void initState(){
    super.initState();
    getData();
    fetchCustomerData();
  }



  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return  Scaffold(
      body: SafeArea(
          child:Stack(
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
                  top: 100,
                  right: 110,
                  child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("images/img.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const Text('Dr. Asmaa Yaser',style: TextStyle(
                            color: Color(0xff233166),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                        ),
                        const Text('Ophthalmologist',style: TextStyle(
                            color: Color(0xff233166),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                        ),
                        const Text('Berlin.Germany',style: TextStyle(
                            color: Color(0xff233166),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                        ),
                      ]
                  )
              ),

              Positioned(
                  top: 430,
                  right: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFC7DFE9), // Choose the background color for your icon
                        ),
                        child: const Icon(
                          Icons.people, // Choose the icon from Flutter's Icons package
                          color: Color(0xff161f44),// Choose the color of your icon
                          size: 50, // Choose the size of your icon
                        ),
                      ),
                      SizedBox(width: 100,),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFC7DFE9), // Choose the background color for your icon
                        ),
                        child: const Icon(
                          Icons.work_history, // Choose the icon from Flutter's Icons package
                          color: Color(0xff161f44),// Choose the color of your icon
                          size: 50, // Choose the size of your icon
                        ),
                      ),
                    ],
                  )
              ),

              Positioned(
                  top: 550,
                  right: 50,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('${Patients.length}'+'+',
                            style:const  TextStyle(
                                color: Color(0xff233166),
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),),
                          const Text('Patients',
                            style: TextStyle(
                                color: Color(0xff233166),
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                        ],
                      ),
                      SizedBox(width: 100,),
                      const Column(
                        children: [
                          Text('10+',
                            style: TextStyle(
                                color: Color(0xff233166),
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),),

                          Text('Experience',
                            style: TextStyle(
                                color: Color(0xff233166),
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                        ],
                      )
                    ],
                  )
              )
            ],
          )
      ),
    );

  }
}