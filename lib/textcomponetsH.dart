import 'package:flutter/material.dart';

class textcomponets extends StatelessWidget {
  String txt;

   textcomponets({
    
    required this.txt,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: Container(
    
    child: Text(txt,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
    
    
      ),
    );
  }
}