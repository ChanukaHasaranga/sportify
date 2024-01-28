import 'package:flutter/material.dart';
import 'package:sportify/createacoundpage/emailadding.dart';
import 'package:sportify/elevatedbuttons/elevatedbuttons.dart';
import 'package:sportify/login.dart';

class signuppage1 extends StatefulWidget {
  const signuppage1({super.key});

  @override
  State<signuppage1> createState() => _signuppage1State();
}

class _signuppage1State extends State<signuppage1> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
body: SafeArea(
  child:   SingleChildScrollView(

  
  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,

  children: [

    Container(
      height: 305,
      width: double.infinity,
decoration: BoxDecoration(
  image: DecorationImage(image:AssetImage("assetss/back.png"),fit: BoxFit.cover)
),
    ),
    Center(
      child: Container(
        height: 53,
        width: 53,
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage("assetss/Logo222.png"),fit: BoxFit.cover)
        ),
      ),

    ),
    Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(91, 10, 91, 0),
        child: Text("Millions of Songs. Free on Spotify.",style: TextStyle(fontSize: 22,color: Colors.white,height: 1.4,wordSpacing: 2,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
      ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(46, 16, 46, 0),
      child: ElevatedButton(onPressed:() {
    
        Navigator.of(context).push(MaterialPageRoute(builder:(context) {
          return emailadding();
        },));
        
      }, child: Text("Sign up free",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      
      style: ElevatedButton.styleFrom(
      
    backgroundColor: const Color.fromARGB(255, 58, 159, 61),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
    fixedSize: Size(337, 49)

      ),
      
      ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(46, 10, 46, 0),
      child: elevatedbutton(txt: 'Continue with Google', imagepath: 'assetss/google.png',),
    ),
     Padding(
      padding: const EdgeInsets.fromLTRB(46, 10, 46, 0),
      child: elevatedbutton(txt: 'Continue with Facebook', imagepath: 'assetss/facebook.png',),
    ),
     Padding(
      padding: const EdgeInsets.fromLTRB(46, 10, 46, 0),
      child: elevatedbutton(txt: 'Continue with Apple', imagepath: 'assetss/Vector.png',),
    ),
    Center(
      child:GestureDetector(
        onTap: () {

          Navigator.of(context).push(MaterialPageRoute(builder:(context) {
            return login();
          },));
          
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Log in",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
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