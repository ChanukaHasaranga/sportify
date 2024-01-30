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
      child: Column(
      children: [
        Container(
          height: 120,
          width: 120,
    decoration: BoxDecoration(

      color: Colors.amber,
      border: Border.all(width: 2,color:isSelected ? const Color.fromARGB(255, 243, 33, 205) : Colors.transparent, ),
    

    shape: BoxShape.circle,
    image: DecorationImage(image:NetworkImage(imagepath),fit: BoxFit.cover)
    ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(name,style: TextStyle(color: Colors.white,),),
        )
      ],
      )
    );
  }
}