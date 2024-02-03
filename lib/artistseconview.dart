import 'package:flutter/material.dart';
import 'package:sportify/songs/songsdetails.dart';

class artist extends StatelessWidget {

  String name;
  String imagepath;
  String colorss;

   artist({
    
    required this.name,
    required this.imagepath,
    required this.colorss,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder:(context) {
            return songsdetails(imagepath: imagepath, name: name, colorss:colorss ,);
          },));
        },
         child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
         
          image: DecorationImage(
            image:NetworkImage(imagepath,),
            fit: BoxFit.cover
            )
             
          )
               ),
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