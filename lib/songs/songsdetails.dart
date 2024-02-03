import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';


class songsdetails extends StatelessWidget {
  String imagepath;
  String name;
  String colorss;

   songsdetails({
    required this.imagepath,
        required this.name,
        required this.colorss,

    
    super.key});

    final currentuser=FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: SafeArea(
        
        
        child:SingleChildScrollView(
          child: StreamBuilder<DocumentSnapshot>(
          
            stream: FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).snapshots(),
            builder: (context, snapshot) {
                if(snapshot.hasData){
              
              
              
            final userdataperson=snapshot.data!.data() as Map<String, dynamic>;
          
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              
                 Stack(
                  children: [
                   Container(
                    height: 370,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                   
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          
                          colors:[
                   Color(int.parse(colorss,)),
                    Color.fromRGBO(25, 25, 25, 1),                  ]
                          
                          
                          )       
                          ),
                      
                             
                    
                   child:Padding(
                     padding: const EdgeInsets.fromLTRB(40, 20, 40, 70),
                     child: Stack(
                       children: [
                       Container(
                       decoration: BoxDecoration(
                         boxShadow:[BoxShadow(
                           blurRadius: 6,
                           color: Colors.black
                         )],
                         image: DecorationImage(image:NetworkImage(imagepath),fit: BoxFit.cover)
                       ),
                       
                       ),
                       Positioned(
                         top: 210,
                         left: 30,
                         right: 30,
                         child: Text(name,style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),)
                         
                         
                         ),
                         Positioned(
                         top: 270,
                   
                         child: Container(
                           color: Color(int.parse(colorss,)),
                           height: 30,
                           width: 340,
                         ),
                   
                         
                         
                         
                         ),
                             Positioned(
                         top: 205,
                   
                         child: Container(
                           color: Color(int.parse(colorss,)),
                           height: 50,
                           width: 10,
                         ),
                         
                         
                         
                         
                         ),
                   
                            
                   
                       ]
                     ),
                   )
                   
                     
                   ),
                     Positioned(
                  top: 320,
                  left: 15,
                  
                  
                  child:Container(
              
                     child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assetss/logo.png")
                    )
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("Made for",style: TextStyle(color: const Color.fromARGB(165, 255, 255, 255),fontSize: 15),),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(userdataperson['name'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                )
              
              ],
                     ),
              
                  )
                  
                  
                  )
                  ]
                 ),
          
                 Container(
                  width: double.infinity,
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       IconButton(onPressed:() {

                         Share.share('Check out this awesome song: $name - $imagepath');

                       }, icon:Icon(Icons.share,color: const Color.fromARGB(184, 255, 255, 255),)),
          
                       SizedBox(
                        height: 50,
                         child: ElevatedButton(onPressed:() {
                           
                         }, 
                         
                         child:Icon(Icons.play_arrow,color: const Color.fromARGB(255, 0, 0, 0),),
                         style: ElevatedButton.styleFrom(
                          
                          backgroundColor: Color.fromARGB(255, 4, 214, 32),
                          
                          shape:CircleBorder()
                         
                         )
                         
                         ),
                       )
                   
                    ],
                   ),
                 )
              
              
              
              
                ],
              
              
              
              
              );
              }else if(snapshot.hasError){
              
                
              
               return Center(
              
               child: Text("Error${snapshot.error}"),
              
              
              
              
              
               );
              
             
              
              }
                return const Center(
              
          child: CircularProgressIndicator()
              
              
              
              );
              
            }
          ),
        )
        
        
        
        
        ),
      


      

    );
  }
}