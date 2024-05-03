import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/startTesting.dart';

class  viewPatient extends StatefulWidget {
  static const String routeName = "viewPatient";
  const viewPatient ({Key? key}) : super(key: key);

  @override
  State<viewPatient> createState() => _viewPatientState();
}

class _viewPatientState extends State<viewPatient> {

  List <QueryDocumentSnapshot> Patients = [];
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Patients').get();
    Patients.addAll(querySnapshot.docs);
    setState(() {

    });
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body:SafeArea(
          child: Stack(
            children: [
              Image.asset(
                "images/bg.png",
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
                        color: Colors.white)),
              ),


              Padding(padding: EdgeInsets.only(top: 70,left: 10,right: 10),
                child: ListView.builder(
                  itemCount: Patients.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,i){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text('Name:',
                                  style: TextStyle(
                                      color: Color(0xff233166),
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('${Patients[i]['Patient_name']}',
                                  style:const TextStyle(
                                      color: Colors.green,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10,),

                            Row(
                              children: [
                                const Text('Age:',
                                  style: TextStyle(
                                      color: Color(0xff233166),
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('${Patients[i]['Age']}',
                                  style:const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10,),

                            Row(
                              children: [
                                const Text('Patient state:',
                                  style: TextStyle(
                                      color: Color(0xff233166),
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('${Patients[i]['Patient_state']}',
                                  style:const TextStyle(
                                      color: Colors.green,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),

                            Row(
                              children: [
                                const Text('Re_Examination Date:',
                                  style: TextStyle(
                                      color: Color(0xff233166),
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('${Patients[i]['re_Examination_Date']}',
                                  style:const TextStyle(
                                      color: Colors.green,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    );
                    }),
              )
            ],
          ),
        ));
  }
}
