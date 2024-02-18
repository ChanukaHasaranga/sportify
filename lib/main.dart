import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sportify/firebase_options.dart';
import 'package:sportify/loadingpage.dart';
import 'package:sportify/singuppage1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  
  runApp( myapp());
}
class myapp extends StatelessWidget {
   myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
debugShowCheckedModeBanner: false,
title: "SPOTIFY",
home: loadingpage(),
theme: ThemeData(
  brightness: Brightness.dark
),


    );
  }
}