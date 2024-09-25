import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LogoutProvider with ChangeNotifier{
  void logOut(){
    final logout= FirebaseAuth.instance;
    logout.signOut();
    // Navigator.pushAndRemoveUntil(context,MaterialPageRoute<void>(builder: (BuildContext context) => const MyHomePage()),
  }
}