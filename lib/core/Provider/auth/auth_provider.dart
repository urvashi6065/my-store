import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../../presentation/home/home_screen/home_screen.dart';
import '../../services/auth_service.dart';class AthProvider with ChangeNotifier {
  late UserCredential userCredential;
  bool isLoading = false;



  Future<void> createUser(
      {required String email, required String password,required BuildContext context,required String username}) async {

    try {
      final userCredentials = await AuthService.signUp(
          email: email, password: password);
      if(context.mounted){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen(userName: username)));
      }
      isLoading=true;
    } catch (e) {
      debugPrint("Error during create user : $e");
    }finally{
   isLoading=false;
    }
    notifyListeners();
  }
}