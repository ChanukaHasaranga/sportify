import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportify/drawerbox.dart';

class drawerfix extends StatefulWidget {
  const drawerfix({super.key});

  @override
  State<drawerfix> createState() => _drawerfixState();
}

class _drawerfixState extends State<drawerfix> {
final currentuser=FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(


      stream: FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).snapshots(),
      builder: (context, snapshot) {
               if (snapshot.hasData) {

              final userdataperson=snapshot.data!.data() as Map<String, dynamic>;

                 
               


        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
    
            Scaffold.of(context).openDrawer(
              
            );
    
            },
            child: Builder(
              builder: (context) {
                return Container(
                 decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber
                 ),
                 child: Center(child: Text(userdataperson["name"][0],style: TextStyle(color: Colors.black,fontSize: 23),)),
                  
                );
              }
            ),
          ),
        );
               }
               else if(snapshot.hasError){

                return Center(
    
     child: Text("Error${snapshot.error}"),
    
    
    
    
    
     );
    
           
    
    }
    return const Center(
    
        child: CircularProgressIndicator()
    
    
    
    );

               }
      
    );
  }
}