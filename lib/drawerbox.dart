import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class drawerbox extends StatelessWidget {
  const drawerbox({super.key});

  @override
  Widget build(BuildContext context) {
    final currentuser=FirebaseAuth.instance.currentUser!;

    return SafeArea(
      child: Drawer(
        width: 350,
    backgroundColor: const Color.fromARGB(255, 40, 40, 40),
    child: StreamBuilder<DocumentSnapshot>(

      
      stream: FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).snapshots(),
      builder:(context, snapshot) {
        
           if(snapshot.hasData){
    
    
    
          final userdataperson=snapshot.data!.data() as Map<String, dynamic>;



      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
        child:   Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                        width: 55,
                        height: 55,
      
                       decoration: BoxDecoration(
        
                        shape: BoxShape.circle,
        
                        color: Colors.amber
        
                       ),
        
                       child: Center(child: Text(userdataperson["name"][0],style: TextStyle(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,)),
        
                        
        
                      ),
    
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,                     
                       children: [
                            Text(userdataperson["name"],style: TextStyle(fontSize: 23,color: Colors.white),),
                            Text("View profile")
                          ],
                        ),
                      )
            ],
          ),
    SizedBox(height: 30,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 43, 43, 43),width: 1)
            ),
          ),
          SizedBox(height: 20,),
    
          Row(
            children: [
              Icon(Icons.flash_on),
              SizedBox(width: 10,),
              Text("What's new",style: TextStyle(fontSize: 18),)
            ],
          ),
          SizedBox(height: 20,),
    
          Row(
            children: [
              Icon(Icons.history),
                          SizedBox(width: 10,),
    
              Text("Listening history",style: TextStyle(fontSize: 18),)
            ],
          ),
          SizedBox(height: 20,),
    
          Row(
            children: [
              Icon(Icons.settings),
                          SizedBox(width: 10,),
    
              Text("Setting and privacy",style: TextStyle(fontSize: 18),)
            ],
          )
        
        ],
        
        ),
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
    
      ),
    );
  }
}