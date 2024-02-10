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

int count=0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
backgroundColor: Color.fromRGBO(25, 25, 25, 1),

appBar:AppBar(
  automaticallyImplyLeading: false,
backgroundColor: Color.fromRGBO(25, 25, 25, 1),
leading: drawerfix(),

) ,
drawer: drawerbox(),

body: SafeArea(
  
  child:SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
           children: [
textcomponets(txt: "Top Mixes"),

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
                
                imagepath: artistdoc[index]['imagepath'],
                 colors:artistdoc[index]['colors'],
                
                ),
             );




          },
          
          
          
          );


    },
    
    
    ),

),

textcomponets(txt: "Your Favourite Mixes"),
Container(
  height: 170,
  width: double.infinity,
  child: StreamBuilder(
    
    stream: FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).snapshots(), 
    builder:(context, snapshot) {
      if (snapshot.hasData) {

final userdataperson=snapshot.data!.data() as Map<String, dynamic>;
  if (userdataperson['favorites'] == null || userdataperson['favorites'].isEmpty) {
        count = 0;
      } else {
        count = userdataperson['favorites'].length;
      }

return ListView.builder(
  itemCount:count,
  scrollDirection: Axis.horizontal,
  itemBuilder:(context, index) {

   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: artist(
      
      name: userdataperson['favorites'][index]['name'], 
      imagepath: userdataperson['favorites'][index]['imagepath'], 
      colorss: userdataperson["favorites"][index]["colorss"], 
      
      
      ),
   );
   



    
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
),
textcomponets(txt: "Your Favourite Artists"),
Container(
  height: 170,
  width: double.infinity,
  child: StreamBuilder(
    
    stream: FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).snapshots(), 
    builder:(context, snapshot) {
      if (snapshot.hasData) {

final userdataperson=snapshot.data!.data() as Map<String, dynamic>;

return ListView.builder(
  itemCount:userdataperson['favartists'].length,
  scrollDirection: Axis.horizontal,
  itemBuilder:(context, index) {

   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: topartists(
      
      name: userdataperson["favartists"][index]['name'], 
      
      imagepath: userdataperson["favartists"][index]['imagepath'], 
      colors:userdataperson["favartists"][index]["colors"],
      )
   );




    
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