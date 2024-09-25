import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LogicProvider with ChangeNotifier{

  bool  currentUser(){
    if(FirebaseAuth.instance.currentUser==null){
      return false;
    }else{
      return true;
    }
  }
}