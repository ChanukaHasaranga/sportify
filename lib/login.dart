import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sportify/firstpage.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
bool passwordvisible=true;

final reemail=TextEditingController();
final repassword=TextEditingController();


Future signin()async{

  try{

await FirebaseAuth.instance.signInWithEmailAndPassword(
  
  email: reemail.text.trim(), 
  password: repassword.text.trim()
  
  
  );

setState(() {

  Navigator.of(context).push(MaterialPageRoute(builder:(context) {
    return firstpage();
  },));
  
});

  }catch(e){

    setState(() {
      showDialog(
        context: context, 
        builder:(context) {
          return AlertDialog(
title:Text("Invalid Email or Password Try again"),
          );
        },);
    });
  }

}



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
                Navigator.of(context).pop();
              }, 
              
              icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 82, 82, 82),size:19,),),
            ),
          ),
          title: Center(child: Text("Login your account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(31, 20, 31, 0),
                  child: Text("What’s your email?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(31, 5, 31, 38),
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.grey
                    ),
                    child: TextField(
                      controller: reemail,
          
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        
                        focusedBorder: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color:Colors.transparent),
                          
                        ),
                        enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color:Colors.transparent),
                        )
                      ),
                    ),
                  ),
                ),
              
          
          
          Padding(
                  padding: const EdgeInsets.fromLTRB(31, 20, 31, 0),
                  child: Text("Enter your password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
          
                Padding(
                  padding: const EdgeInsets.fromLTRB(31, 5, 31, 38),
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.grey
                    ),
                    child: TextField(
                      controller: repassword,
                      obscureText:passwordvisible,
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        suffixIcon: IconButton( icon: Icon(passwordvisible? Icons.visibility_off:Icons.visibility,color: Colors.black,),
                        
                        onPressed:() {
          
                          setState(() {
                                                    passwordvisible=!passwordvisible;
          
                          });
                        },
                        
                        ),
                        focusedBorder: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color:Colors.transparent),
                          
                        ),
                        enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color:Colors.transparent),
                        )
                      ),
                    ),
                  ),
                ),
              
                  
          
          
          
          Center(
            child:   ElevatedButton(onPressed:() {
          
           signin();
            
            
            }, 
            
            style: ElevatedButton.styleFrom(
            
              backgroundColor: Colors.grey,
            
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23))
            
            ),
            
            
            
            child: Text("Login",style: TextStyle(color: Colors.black),)),
          )  ,
            
              ],
          
            ),
          ),


    );
  }
}