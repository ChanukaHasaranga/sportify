import 'package:flutter/material.dart';
import 'package:sportify/drawerbox.dart';
import 'package:sportify/drawerfix.dart';
import 'package:sportify/textcomponetsH.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
backgroundColor: Color.fromRGBO(25, 25, 25, 1),

appBar:AppBar(
  automaticallyImplyLeading: false,
backgroundColor: Colors.transparent,
leading: drawerfix(),

) ,
drawer: drawerbox(),

body: SafeArea(
  
  child:SingleChildScrollView(
    child: Column(
           children: [
textcomponets(txt: "Your top mixes")


           ],


    ),
  )
  
  
  
  
  ),

    );

    
  }
}