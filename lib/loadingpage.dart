import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sportify/singuppage1.dart';

class loadingpage extends StatefulWidget {
  const loadingpage({super.key});

  @override
  State<loadingpage> createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {
  void initState(){
    super.initState();

  Timer(const Duration(seconds: 5), () {

Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  return signuppage1();
},));

   });  
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
    
      decoration: BoxDecoration(

        color: Color.fromRGBO(25, 25, 25, 1),
      ),

      child: Center(child: Image.asset("assetss/logo.png",height: 150,width: 150,)),
      
    
      ),
    );
  }
}