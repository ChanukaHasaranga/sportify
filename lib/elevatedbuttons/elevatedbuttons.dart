import 'package:flutter/material.dart';

class elevatedbutton extends StatelessWidget {
  String txt;
  String imagepath;

   elevatedbutton({
    
    required this.txt,
    required this.imagepath,
    
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
child:ElevatedButton(onPressed:() {
  

}, 
style: ElevatedButton.styleFrom(
fixedSize: Size(337, 49),
backgroundColor:Colors.transparent,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23,),),
side: BorderSide(color: Colors.white)

),
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
Container(
  height: 18,
  width: 18,
  decoration: BoxDecoration(
    image: DecorationImage(image:AssetImage(imagepath),fit: BoxFit.cover)
  ),
)    ,
    Padding(
          padding: const EdgeInsets.only(left: 42),
          child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        ),

  ],
)),


    );
  }
}