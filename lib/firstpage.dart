import 'package:flutter/material.dart';
import 'package:sportify/elevatedbuttons/artistselectcontainer.dart';
import 'package:sportify/login.dart';

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color.fromRGBO(25, 25, 25, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
              ),
              child: IconButton(onPressed:() {
                Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                  return login();
                },));
              }, 
              
              icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 82, 82, 82),size:19,),),
            ),
          ),
          title: Center(child: Text("Choose 3 or more artists you like.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
        body:Column(
          children: [
            artistselect()
          ],
        )
    );
  }
}