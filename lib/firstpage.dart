import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportify/Homepage.dart';
import 'package:sportify/elevatedbuttons/artistselectcontainer.dart';
import 'package:sportify/login.dart';

class firstpage extends StatefulWidget {
   firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  List<Map<String, dynamic>> selectedItems = [];
      final currentuser=FirebaseAuth.instance.currentUser!;


  final artist=FirebaseFirestore.instance.collection("artists").snapshots();
String name='';
String imagepath="";
String colors='';
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
                Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                  return login();
                },));
              }, 
              
              icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 82, 82, 82),size:19,),),
            ),
          ),
          title: Center(child: Text("Choose 3 or more artists you like.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
        body:SafeArea(

          child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).snapshots(),
            builder: (context, snapshot) {
               
               if(snapshot.hasData){
          
            final userdataperson=snapshot.data!.data() as Map<String, dynamic>;
          
          
               
            
            
            return StreamBuilder(
                    
                    
              stream: artist,
              builder: (context, snapshot) {
                    
                if (snapshot.hasError) {
                    
                 return Text("Connection Error");
                  
                }
                if (snapshot.connectionState==ConnectionState.waiting) {
                    
                 return Text("Loading....");
                  
                }
                    
               var artistbar=snapshot.data!.docs;
                    
                    
                    
                    
                    
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                  
                    itemCount: artistbar.length,
                    
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      
                      crossAxisCount: 2
                      
                      
                      ),
                    
                    itemBuilder:(context, index) {
                
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          
                          onTap: () {
                            name=artistbar[index]['name'];
                            imagepath=artistbar[index]['imagepath'];
                            colors=artistbar[index]['colors'];
                           bool alreadySelected = selectedItems.any((item) => item['name'] == artistbar[index]['name']);

                           
                    
                    if (alreadySelected) {
                      // If already selected, remove it from the list
                      setState(() {
                        removefavourite();
                        selectedItems.removeWhere(
                            (item) => item['name'] == artistbar[index]['name']);
                      });
                    } else if (selectedItems.length < 3) {
                      // If not selected and less than 3 items are selected, add it to the list
                      setState(() {
                        addtofavourite();
                        selectedItems.add({
                          'name': artistbar[index]['name'],
                          'imagepath': artistbar[index]['imagepath'],
                        });
                      });
                    }
                    print(selectedItems);
                    
                  },
                          child: artistselect(
                            
                            
                            name:artistbar[index]['name'],
                            imagepath:artistbar[index]['imagepath'],
                            isSelected: selectedItems.any((item) => item['name'] == artistbar[index]['name']),
                    
                          
                          
                          ),
                        ),
                      );
                      
                    },),
                );
              }
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
          ),
        ),

        floatingActionButton: FloatingActionButton(
    backgroundColor: const Color.fromARGB(255, 62, 62, 62),
    
          onPressed:() {

            if (selectedItems.length==3) {

Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  return homepage();
},));              
            }else{
             showDialog(
              context: context,
               builder:(context) {
                 return AlertDialog(
                  
                       backgroundColor: Colors.white,
                   title: Text("Please select 3 of Artists",style: TextStyle(color: Colors.black),),

                 );



               },
               );




            }
            
          },
          
          child:Icon(Icons.arrow_forward_ios,color: Colors.black,)
          
          
          ),
    );
    
  }
  void addtofavourite() {
  FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).update({
    "favartists": FieldValue.arrayUnion([
      {"name": name, "imagepath": imagepath,"colors":colors}
    ])
  });
}
   void removefavourite(){
FirebaseFirestore.instance.collection("Users").doc(currentuser.email!).update({
    "favartists": FieldValue.arrayRemove([
      {"name": name, "imagepath": imagepath,"colors":colors}
    ])
  });    }
  
}