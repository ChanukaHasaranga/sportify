import 'package:flutter/material.dart';

class artistselect extends StatelessWidget {
  const artistselect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: 130,
decoration: BoxDecoration(
  shape: BoxShape.circle,
  image: DecorationImage(image:AssetImage("assetss/R.jpg"),fit: BoxFit.cover)
),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("Billie Eilish",style: TextStyle(color: Colors.white,fontSize: 23),),
        )
      ],
    );
  }
}