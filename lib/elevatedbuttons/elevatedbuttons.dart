import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class elevatedbutton extends StatelessWidget {
  String txt;
  String imagepath;

   elevatedbutton({
    
    required this.txt,
    required this.imagepath,
    
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
child:ElevatedButton(onPressed:() {

  if (txt=='Continue with Google') {
             _handleGoogleSignIn();

  }
  

}, 
style: ElevatedButton.styleFrom(
fixedSize: Size(337, 49),
backgroundColor:Colors.transparent,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23,),),
side: BorderSide(color: Colors.white)

),
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
Container(
  height: 18,
  width: 18,
  decoration: BoxDecoration(
    image: DecorationImage(image:AssetImage(imagepath),fit: BoxFit.cover)
  ),
)    ,
    Padding(
          padding: const EdgeInsets.only(left: 42),
          child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        ),

  ],
)),


    );
  }
  Future<void> _handleGoogleSignIn() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    if (googleSignInAccount == null) {
      // The user canceled the Google Sign-In process.
      return;
    }

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null) {
      // User successfully signed in with Google.
      print('Google Sign-In successful! User ID: ${user.uid}');
    } else {
      // Handle the case where user is null.
    }
  } catch (error) {
    print('Google Sign-In failed. Error: $error');
  }
}

}