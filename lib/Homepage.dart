import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportify/artistseconview.dart';
import 'package:sportify/drawerbox.dart';
import 'package:sportify/drawerfix.dart';
import 'package:sportify/elevatedbuttons/artistselectcontainer.dart';
import 'package:sportify/textcomponetsH.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final artists=FirebaseFirestore.instance.collection("artists").snapshots();


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
      crossAxisAlignment: CrossAxisAlignment.start,
           children: [
textcomponets(txt: "Your top mixes"),

Container(
  height: 500,
  child:StreamBuilder(
  
  
    stream: stream, 
    
  
    
    builder: builder)
),



           ],


    ),
  )
  
  
  
  
  ),

    );

    
  }
}