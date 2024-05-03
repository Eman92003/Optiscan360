import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/doctorInfo.dart';
import 'package:optiscan/ourvision.dart';
import 'package:optiscan/patientData.dart';
import 'package:optiscan/signin.dart';
import 'package:optiscan/startTesting.dart';
import 'package:optiscan/viewPatient.dart';

class appBar extends StatefulWidget {
  static const String routeName = "appBar";
  const appBar ({super.key});

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xff9cd6ee)),
                accountName: Text(''),

              accountEmail: Padding(
                padding: EdgeInsets.only(left:8.0),
                child: Text(user != null ? user.email ?? 'No email' : 'Not signed in',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                  color: Color(0xff021542),
                ),),
              ),


              currentAccountPicture: const Padding(
                padding: EdgeInsets.only(top:5),
                child: Icon(Icons.account_circle_outlined,size: 90,color: Color(0xff021542),)
              ),),

            const SizedBox(height: 50,),

            ListTile(
              title: const Text("Home Page",
                style: TextStyle(
                    color: Color(0xff021542),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway"
                ),) ,
              leading: const Icon(Icons.home,
                color: Color(0xff021542),
                size: 25,) ,
              onTap: (){Navigator.pushNamed(context, startTesting.routeName);},
            ),

            const SizedBox(height: 20,),

            ListTile(
              title: const Text("Profile",
                style: TextStyle(
                    color: Color(0xff021542),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway"
                ),) ,
              leading: const Icon(Icons.person,
                color: Color(0xff021542),
                size: 25,) ,
              onTap: (){Navigator.pushNamed(context, doctorInfo.routeName);},
            ),

            const SizedBox(height: 20,),

            ListTile(
              title: const Text("Patient Data",
                style: TextStyle(
                  color: Color(0xff021542),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  fontFamily: "Raleway"
                ),) ,
              leading: const Icon(Icons.local_hospital,
                color: Color(0xff021542),
                size: 25,) ,
              onTap: (){Navigator.pushNamed(context, PatientData.routeName);},
            ),

            const SizedBox(height: 20,),

            ListTile(
              title: const Text("My Pateints",
                style: TextStyle(
                    color: Color(0xff021542),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway"
                ),) ,
              leading: const Icon(Icons.people,
                color: Color(0xff021542),
                size: 25,) ,
              onTap: (){Navigator.pushNamed(context, viewPatient.routeName);},
            ),

            const SizedBox(height: 20,),


            ListTile(
              title: const Text("Our Vision",
                style: TextStyle(
                    color: Color(0xff021542),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway"
                ),) ,
              leading: const Icon(Icons.visibility,
                color: Color(0xff021542),
                size: 25,) ,
              onTap: (){Navigator.pushNamed(context, ourvision.routeName);},
            ),

            const SizedBox(height: 20,),

            ListTile(
              title: const Text("Sign out",
                style: TextStyle(
                    color: Color(0xff021542),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway"
                ),) ,
              leading: const Icon(Icons.logout,
                color: Color(0xff021542),
                size: 25,) ,
              onTap: ()async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, signin.routeName);
              },
            )
          ],
        ),
      );
  }
}
