import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportify/createacoundpage/nameadding.dart';
import 'package:sportify/elevatedbuttons/elevatedbuttons.dart';
import 'package:sportify/singuppage1.dart';

class emailadding extends StatefulWidget {
  const emailadding({super.key});

  @override
  State<emailadding> createState() => _emailaddingState();
}

class _emailaddingState extends State<emailadding> {
  bool passwordvisible=true;
  Color bordercolor=Colors.transparent;
  final email=TextEditingController();
  final password=TextEditingController();

Future emailgetting() async{

  try{

UserCredential userCredential=
await FirebaseAuth.instance.createUserWithEmailAndPassword(
  
  email: email.text.trim(),
  
   password: password.text.trim()
   
   
   );

FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.email!).set(


{

"Email":email.text.trim()



}


);

 Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                              
                                 return  nameadding(email: userCredential.user!.email!,);

                           },));

  }
on FirebaseAuthException{


showDialog(
  context: context, 
  
  builder:(context) {
   return const AlertDialog(

title:Text("Some Inputs are Wrong! Try again ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),)

    );
  },
  
  );


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
          title: Center(child: Text("Create account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(31, 20, 31, 0),
                child: Text("What’s your email?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(31, 5, 31, 0),
                child: Container(
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: bordercolor),
                    color: Colors.grey
                  ),
                  child: TextField(
                    controller: email,

                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      
                      focusedBorder: OutlineInputBorder(
                        
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color:bordercolor),
                        
                      ),
                      enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color:bordercolor),
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(31, 3, 31, 38),
                child: Text("You’ll need to confirm this email later.",style: TextStyle(color: Colors.white,fontSize: 8),),
              ),


Padding(
                padding: const EdgeInsets.fromLTRB(31, 20, 31, 0),
                child: Text("Create a password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(31, 5, 31, 0),
                child: Container(
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: bordercolor),
                    color: Colors.grey
                  ),
                  child: TextField(
                    controller: password,
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
                        borderSide: BorderSide(color:bordercolor),
                        
                      ),
                      enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color:bordercolor),
                      )
                    ),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(31, 3, 31, 38),
                child: Text("Use atleast 8 characters.",style: TextStyle(color: Colors.white,fontSize: 8),),
              ),
        



Center(
  child:   ElevatedButton(onPressed:() {

    setState(() {
        if (email.text!="") {
      
      emailgetting();

    }
    });
  
  
  }, 
  
  style: ElevatedButton.styleFrom(
  
    backgroundColor: Colors.grey,
  
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23))
  
  ),
  
  
  
  child: Text("Next",style: TextStyle(color: Colors.black),)),
)  ,
  
            ],

          ),


    );
  }
}