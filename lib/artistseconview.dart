import 'package:flutter/material.dart';

class artist extends StatelessWidget {

  String name;
  String imagepath;
  bool isSelected;

   artist({
    
    required this.name,
    required this.imagepath,
    required this.isSelected,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
        border: Border.all(width: 2,color:isSelected ? const Color.fromARGB(255, 243, 33, 205) : Colors.transparent, ),

        image: DecorationImage(
          image:NetworkImage(imagepath,),
          fit: BoxFit.cover
          )
    
        )
      ),
      Positioned(
        top: 100,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 50, 0),
          child: Container(
            width: 120,
            child: Text(name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            
          ),
        ),
      )
      ]
    );
  }
}