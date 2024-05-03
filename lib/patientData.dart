import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/customFormFeild.dart';
import 'package:optiscan/startTesting.dart';
import 'package:optiscan/customDropDownList.dart';
import 'package:optiscan/customElevatedBottom.dart';
import 'package:optiscan/customFormFeild.dart';

class  PatientData extends StatefulWidget {
  static const String routeName = "PatientData";
  const PatientData ({super.key});

  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> {
  TextEditingController PateintName = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController ExaminationDate = TextEditingController();
  TextEditingController re_ExaminationDate = TextEditingController();
  String? _selectedValue ='Normal';

  CollectionReference Patients = FirebaseFirestore.instance.collection('Patients');


  Future<void> addPatient() {
    // Call the user's CollectionReference to add a new user
    return Patients
        .add({
      'Patient_name' : PateintName.text,
      'Age' : Age.text,
      'Examination_Date' : ExaminationDate.text,
      're_Examination_Date' : re_ExaminationDate.text,
      'Patient_state': _selectedValue
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


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
                Image.asset("images/first page.png"),

                Positioned(
                  top: 20,
                  child: IconButton(onPressed: (){Navigator.pushNamed(context, startTesting.routeName);},
                      icon: const Icon(Icons.arrow_back,
                          size: 30,
                          color: Color(0xff021542))),
                ),
                Padding(
                padding: EdgeInsets.all(20.0),

                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 90,),

                    const Text("Patient", style:
                    TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542)),),

                    const SizedBox(height: 0.5,),

                    const Text("Information", style:
                    TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff021542)),),

                    const SizedBox(height: 20,),


                    CustomTextFormField(
                      controller: PateintName,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter patient's name";
                        }
                        return null;
                      },
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                      readOnly: true,
                    ),

                    const SizedBox(height: 20,),

                    CustomTextFormField(
                      controller: Age,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter patient's age";
                        }
                        return null;
                        },
                      labelText: "Age",
                      prefixIcon: Icon(Icons.hourglass_top),
                      readOnly: true,
                    ),

                    const SizedBox(height: 20,),

                    CustomDropDownList<String>(
                        value: _selectedValue!,
                        labelText: 'State',
                        prefixIcon: const Icon(Icons.local_hospital),
                        items: <String>['Glaucoma','Normal'],
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },),

                    const SizedBox(height: 20,),


                    CustomTextFormField(
                        controller: ExaminationDate,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter examination date";
                        }
                        return null;
                      },
                      labelText: "Examination Date",
                      prefixIcon:  Icon(Icons.calendar_month_outlined),
                      readOnly: false,
                    ),

                    const SizedBox(height: 20,),

                    CustomTextFormField(
                      controller: re_ExaminationDate,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter re_examination date";
                        }
                        return null;
                      },
                      labelText: "Re-Examination Date",
                      prefixIcon:  Icon(Icons.calendar_month_outlined),
                      readOnly: false,
                    ),

                    const SizedBox(height: 60,),

                    Center(
                      child: CustomElevatedButton(
                        onPressed: (){
                          if (formKey.currentState!.validate()) {
                            // If the form is valid, proceed to addPatient and navigation
                            addPatient();
                            Navigator.pushNamed(context, startTesting.routeName);
                          }
                        },
                        text: 'Add Patient',
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


