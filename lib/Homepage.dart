import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportify/artistseconview.dart';
import 'package:sportify/drawerbox.dart';
import 'package:sportify/drawerfix.dart';
import 'package:sportify/elevatedbuttons/artistselectcontainer.dart';
import 'package:sportify/textcomponetsH.dart';
import 'package:sportify/topartist.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final topmix=FirebaseFirestore.instance.collection("top mix").snapshots();
  final artists=FirebaseFirestore.instance.collection("artists").snapshots();
    final currentuser = FirebaseAuth.instance.currentUser!;



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
backgroundColor: Color.fromRGBO(25, 25, 25, 1),

appBar:AppBar(
  automaticallyImplyLeading: false,
backgroundColor: Colors.transparent,
leading: drawerfix(),

) ,
drawer: drawerbox(),

body: SafeArea(
  
  child:SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
           children: [
textcomponets(txt: "Your top mixes"),

Container(
  height: 170,
  width: double.infinity,
  child:StreamBuilder(
  
  
    stream: topmix, 
    
  
    
    builder:(context, snapshot) {

    if (snapshot.hasError) {

      return Text("Erros");
      
    }if (snapshot.connectionState==ConnectionState.waiting) {

      return Text("loading........");
      
    }

var topmixdoc=snapshot.data!.docs;

      
   return ListView.builder(

scrollDirection: Axis.horizontal,
    itemCount: topmixdoc.length,
    
    itemBuilder:(context, index) {
      
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: artist(
            
            name: topmixdoc[index]["name"], 
            
            imagepath:topmixdoc[index]['imagepath'], 
            
            colorss: topmixdoc[index]['colors'], 
            
            
            ),
        );




    },
    
    
    );




    },)
),

textcomponets(txt: "Top Artists"),

Container(
  height: 170,
  width: double.infinity,

  child: StreamBuilder(
    stream: artists, 
    builder:(context, snapshot) {
      
        if (snapshot.hasError) {

          return Text("Error");
          
        }

        if (snapshot.connectionState==ConnectionState.waiting) {
          return Text("Loading....");
          
        }

        var artistdoc=snapshot.data!.docs;

        return ListView.builder(
          scrollDirection: Axis.horizontal,

          itemCount: artistdoc.length,
          
          itemBuilder:(context, index) {
            
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: topartists(
                
                name: artistdoc[index]['name'], 
                
                imagepath: artistdoc[index]['imagepath']
                
                ),
             );




          },
          
          
          
          );


    },
    
    
    ),

),

textcomponets(txt: "Your Favourite Songs"),
Container(
  height: 170,
  width: double.infinity,
  child: StreamBuilder(
    
    stream: FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).snapshots(), 
    builder:(context, snapshot) {
      if (snapshot.hasData) {

final userdataperson=snapshot.data!.data() as Map<String, dynamic>;
List<dynamic>? favoriteSongs = userdataperson['favourite'];

return ListView.builder(
  
  itemBuilder:(context, index) {
    
  },
  
  );

      }
      else if (snapshot.hasError) {
        return Text("Error");
      }
    
                 return const Center(
            child: CircularProgressIndicator(),
          );  


    },
    
    
    ),
)






           ],


    ),
  )
  
  
  
  
  ),

    );

    
  }
}