import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logindeneme/LoginSayfa.dart';
import 'package:logindeneme/sign_in.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("TarumarHome"),
      ),
      body: _homeBody(),
    );
  }

  Widget _homeBody() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl)
                  : NetworkImage(
                      "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg"),
              radius: 70,
              backgroundColor: Colors.transparent,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Name : ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  name != null
                      ? Text(
                          name,
                          style: TextStyle(fontSize: 22),
                        )
                      : new Text(
                          "Bruce Wayne",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
