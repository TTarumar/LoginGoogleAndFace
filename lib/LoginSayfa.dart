import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logindeneme/HomeScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:logindeneme/deneme.dart';
import 'package:logindeneme/sign_in.dart';



class LoginSayfa extends StatefulWidget {
  @override
  _LoginSayfaState createState() => _LoginSayfaState();
}

class _LoginSayfaState extends State<LoginSayfa> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name;
  String email;
  String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarumar"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              loginGoogle(),// bu şekilde çağırmak oop kardeşim önerilir
            ],
          ),
        ),
      ),
    );
  }

  Future<FirebaseUser> signInGoogle() async {
    FirebaseUser firebaseUser;
    bool girisSorgu = await _googleSignIn.isSignedIn();
    if (girisSorgu) {
      firebaseUser = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleSignInAccount =
      await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      firebaseUser = (await _auth.signInWithCredential(credential)).user;
    }
    return firebaseUser;
  }



  void signOutGoogle() async {
    await _googleSignIn.signOut();

    print("User Sign Out");
  }


  Widget loginGoogle() {//burada widget olarak tanımlandı
    return OutlineButton(
      onPressed: ()  {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          );
        });
      },
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google.png"),height: 35.0,),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("Sign in with Google",style: TextStyle(color: Colors.grey ),),
            )
          ],
        ),
      ),
    );
  }
  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await signInGoogle();
   // Navigator.push(context,
      //  MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
