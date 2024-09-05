import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/presentation/home_screen.dart';
import 'package:provider/provider.dart';


import '../core/Provider/auth/auth_provider.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import 'forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery
        .of(context)
        .size
        .height;
    final _width = MediaQuery
        .of(context)
        .size
        .width;
    final authProvider = Provider.of<AthProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(CupertinoIcons.back, size: 32,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.login,
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
                SizedBox(height: 73,),

                Container(
                  height: _height * 0.09,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: AppColors.red,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          labelText: "Email",
                          labelStyle: TextStyle(color: AppColors.darkGrey),
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Email';
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  height: _height * 0.09,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: AppColors.red,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          labelText: "Password",
                          labelStyle: TextStyle(color: AppColors.darkGrey),
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Password ';
                        }
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotScreen()));
                            },
                            child: Text(AppStrings.forgotPass, style: TextStyle(
                                fontSize: 14),))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('object');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen(userName:'',)));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: _height * 0.06,
                      decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(child: authProvider.isLoading
                          ? CircularProgressIndicator()
                          : Text(AppStrings.login, style: TextStyle(
                          color: AppColors.white, fontSize: 20),)),
                    ),
                  ),
                ),
                Center(child: Padding(
                  padding: const EdgeInsets.only(top: 192.0),
                  child: Text(
                    AppStrings.account, style: TextStyle(fontSize: 14),),
                )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _width * 0.2,
                        height: _height * 0.08,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(24)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image(image: AssetImage(
                              'assets/logo/GoogleLogo.png')),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Container(
                        width: _width * 0.2,
                        height: _height * 0.08,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(24)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image(image: AssetImage(
                              'assets/logo/FacebookLogo.png')),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
