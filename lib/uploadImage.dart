import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:optiscan/startTesting.dart';
import 'package:optiscan/callAPI.dart';


class  uploadImage extends StatefulWidget {
  static const String routeName = "uploadImage";
  const uploadImage ({super.key});

  @override
  State<uploadImage> createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {

  File? _selectedImage;
  String? _result;


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
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
                top: 20,
                child: IconButton(onPressed: (){Navigator.pushNamed(context, startTesting.routeName);},
                    icon: const Icon(Icons.arrow_back,
                        size: 30,
                        color: Color(0xff021542))),
              ),

              const SizedBox(height: 20,),

              Positioned(
                right:50,
                child:
                Column(children: [
                  Image.asset(
                    height: 300 ,
                    width: 300,
                    'images/optiscan.png', // Replace 'assets/image.png' with your image path
                    fit: BoxFit.cover,),

                  Center(
                      child:
                      _selectedImage != null ? Image.file(_selectedImage!,height: 300,width: 300,) :
                      const Text("Select image please!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Raleway",
                        color: Color(0xff021542)
                        ),
                      )
                  ),

                  const SizedBox(height: 10,),

                  MaterialButton(
                      color: Colors.blue,
                      child:
                      const Text(
                        "Pick image from gallery",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Raleway",
                            fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: (){_pickimagefromgallery();}
                  ),

                  const SizedBox(height: 20,),

                  Text(_result ?? '',
                    style: const TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                      fontWeight: FontWeight.bold,
                        color: Color(0xff021542))
                  )

                ],),
              ),
            ],
          ),
        )
    );
  }

  Future _pickimagefromgallery() async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage == null) return;
    setState(() {
      _selectedImage=File(returnImage!.path);
    });
    final imageBytes = await File(returnImage.path).readAsBytes();
    String result = await predictImage(imageBytes);

    setState(() {
      _result = result;
    });
  }
}
