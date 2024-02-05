import 'package:flutter/material.dart';

class songview extends StatelessWidget {
  String imagepath;
   songview({
    
    required this.imagepath,
    
    super.key});

  @override
  Widget build(BuildContext context) {
  double containerHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      appBar: AppBar(
        title: Center(child: Text("Sinhala Mix",style: TextStyle(color: Colors.white,fontSize: 15),)),
        leading: IconButton(onPressed:() {
          
        }, icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,)),
        actions: [
          IconButton(onPressed:() {
            
          }, icon: Icon(Icons.home,color: Colors.white,))
        ],
        backgroundColor: Colors.transparent,
      ),
body: SafeArea(
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Container(
           width: double.infinity,
           height: containerHeight,
           decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(imagepath),fit: BoxFit.cover),
          
            borderRadius: BorderRadius.circular(13)
           ),
          
          ),
        )
      
      
      ],
      
    ),
  ),
),






    );
  }
}