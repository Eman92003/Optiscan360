import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/Drawer.dart';
import 'package:optiscan/ourvision.dart';
import 'package:optiscan/signin.dart';
import 'package:optiscan/signup.dart';
import 'package:optiscan/home page.dart';
import 'package:optiscan/logo.dart';
import 'package:optiscan/startTesting.dart';
import 'package:optiscan/patientData.dart';
import 'package:optiscan/uploadImage.dart';
import 'package:optiscan/viewPatient.dart';
import 'firebase_options.dart';
import 'package:optiscan/doctorInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: logoScreen.routeName,
      routes: {
        logoScreen.routeName: (context) =>  logoScreen(),
        homepage.routeName: (context) => const homepage(),
        signin.routeName: (context) => const signin(),
        signup.routeName: (context) => const signup(),
        startTesting.routeName: (context) => const startTesting(),
        PatientData.routeName: (context) => const PatientData(),
        uploadImage.routeName: (context) => const uploadImage(),
        appBar.routeName: (context) => const appBar(),
        ourvision.routeName: (context) => const ourvision(),
        viewPatient.routeName: (context) => const viewPatient(),
        doctorInfo.routeName: (context) =>  doctorInfo(),
      },
       //home: doctorInfo(),
    );
  }
}
