import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class nameadding extends StatefulWidget {

    String email;


   nameadding({
    
    required this.email,
    super.key});

  @override
  State<nameadding> createState() => _nameaddingState();
}

class _nameaddingState extends State<nameadding> {
  final name=TextEditingController();
   bool ? ischecked=false;
   bool ? ischecked2=false;




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
          title: Center(child: Text("Create account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(31, 20, 31, 0),
                  child: Text("What’s your name?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(31, 5, 31, 0),
                  child: Container(
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.grey
                    ),
                    child: TextField(
                      controller: name,
                      
          
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
                  padding: const EdgeInsets.fromLTRB(31, 3, 31, 50),
                  child: Text("This appears on your spotify profile",style: TextStyle(color: Colors.white,fontSize: 8),),
                ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 10),
            child:   Container(
            
              width: double.infinity,
            
              height: 1,
            
              decoration: BoxDecoration(
            
                color: const Color.fromARGB(255, 255, 255, 255)
            
              ),
            
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(39, 20, 39, 0),
            child:   Container(
            
            
            
            width: double.infinity,
            
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.start,
            
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
            
                Text("By tapping on “Create account”, you agree to the spotify Terms of Use.",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 10),),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text("Terms of Use",style: TextStyle(color: Color.fromARGB(255, 38, 189, 38),fontSize: 10),),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text("To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 10),),
                ),
          
                  Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text("Privacy Policy",style: TextStyle(color: Color.fromARGB(255, 38, 189, 38),fontSize: 10),),
                ),
                
                
          
            
            
            
              ],
            
            ),
            
            ),
          
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(39, 20, 39, 0),
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
              children: [
            
            Container(   
            
              child: Column(
            
                children: [
            
            Text("Please send me news and offers from Spotify.",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 10),),
            
                ],
            
              ),
            
              
            
              ),
            
            Container(
              child: Checkbox(
                value: ischecked,
                activeColor: Colors.white,
                checkColor: Colors.black,
                
                 onChanged:(value) {
                  setState(() {
                    
                    ischecked= value;
                  });
                   
                 },),
                  
            )
            
              ],
            
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(39, 20, 39, 0),
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
              children: [
            
            Container(   
              width: 250,
            
              child: Column(
            
                children: [
            
            Text("Share my registration data with Spotify’s content providers for marketing purposes.",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 10),),
          
          
            
                ],
            
              ),
            
              
            
              ),
            
            Container(
              child: Checkbox(
                value: ischecked2,
                activeColor: Colors.white,
                checkColor: Colors.black,
                
                 onChanged:(value) {
                  setState(() {
                    
                    ischecked2= value;
                  });
                   
                 },),
                  
            )
            
              ],
            
            ),
          ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Center(
                  child:   ElevatedButton(onPressed:() {
                
                    setState(() {
                        if (name.text!="") {
                      
                     FirebaseFirestore.instance.collection("Users").doc(widget.email).set(
                      
                {
                  "name":name.text.trim(),
                  "Email":widget.email
                }
                     );
                
                    }
                    });
          
                    setState(() {
                      if (ischecked==true && ischecked2==true) {
          
                        print("okay");
                        
                      }
                      else{
          showDialog(
            context:context, 
            builder:(context) {
             return AlertDialog(
          
          title:Text("please select privacy policy",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),)
          
              );
            },);                    }
                    });
                  
                  
                  }, 
                  
                  style: ElevatedButton.styleFrom(
                  
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23))
                  
                  ),
                  
                  
                  
                  child: Text("Create an account",style: TextStyle(color: Colors.black),)),
                ),
                )  ,
          
          
          
                     ],
          
            ),
          ),


    );
  }
}

