import 'package:flutter/material.dart';

class drawerbox extends StatelessWidget {
  const drawerbox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 350,
    backgroundColor: const Color.fromARGB(255, 40, 40, 40),
    child: Padding(
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
      
                     child: Center(child: Text("C",style: TextStyle(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,)),
      
                      
      
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,                     
                     children: [
                          Text("ChanukaHasaranga",style: TextStyle(fontSize: 23,color: Colors.white),),
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
        )
      
      ],
      
      ),
    ),
    
      ),
    );
  }
}