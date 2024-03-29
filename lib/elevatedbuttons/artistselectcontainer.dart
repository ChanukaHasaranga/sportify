import 'package:flutter/material.dart';

class artistselect extends StatelessWidget {

String name;
String imagepath;
bool isSelected;


   artistselect({
    required this.isSelected,
    required this.name,
    required this.imagepath,
    
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
       height: 100,
    decoration: BoxDecoration(

      color: const Color.fromARGB(255, 255, 255, 255),
      border: Border.all(width: 2,color:isSelected ? const Color.fromARGB(255, 243, 33, 205) : Colors.transparent, ),
    

    shape: BoxShape.circle,
    image: DecorationImage(image:NetworkImage(imagepath),fit: BoxFit.contain)
    ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 2),
          child: Container(   
            child: Text(name,style: TextStyle(color: Colors.white,fontSize: 18),)),
        )
      ],
      )
    );
  }
}