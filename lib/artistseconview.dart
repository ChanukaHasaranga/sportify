import 'package:flutter/material.dart';

class artist extends StatelessWidget {

  String name;
  String imagepath;

   artist({
    
    required this.name,
    required this.imagepath,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(

        image: DecorationImage(
          image:NetworkImage(imagepath,),
          fit: BoxFit.cover
          )
    
        )
      ),
      Positioned(
        top: 120,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 50, 0),
          child: Container(
            width: 120,
            child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            
          ),
        ),
      )
      ]
    );
  }
}