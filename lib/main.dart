import 'package:flutter/material.dart';
import 'package:sportify/loadingpage.dart';
import 'package:sportify/singuppage1.dart';

void main(){
  runApp(const myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
debugShowCheckedModeBanner: false,
title: "Spotify",
home: loadingpage(),









    );
  }
}