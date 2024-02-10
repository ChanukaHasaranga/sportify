import 'package:flutter/material.dart';
import 'package:sportify/songs/songsdetails.dart';

class topartists extends StatelessWidget {
String name;
String imagepath;
String colors;

   topartists({
    
    required this.name,
    required this.imagepath,
    required this.colors,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) {
              return songsdetails(imagepath: imagepath, name: name, colorss: colors);
            },));
          },
          child: Container(
                 height: 100,
                 width: 100,
              decoration: BoxDecoration(
          
                color: const Color.fromARGB(255, 255, 255, 255),
              
          
              shape: BoxShape.circle,
              image: DecorationImage(image:NetworkImage(imagepath),fit: BoxFit.cover)
              ),
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