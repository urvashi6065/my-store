import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mystore/core/constants/app_colors.dart';
import 'package:mystore/core/constants/app_strings.dart';

import 'package:provider/provider.dart';

import '../core/Provider/auth/auth_provider.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // singUp(){
  //   // FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
  // }
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  // Signup Screen : email, password --> Provider : email, password --> AuthService : email, password
  // User data : AuthService --> Provider --> Signup screen

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AthProvider>(context, listen: false);

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.grey,
      body: SizedBox(
        height: _height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 10),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signup,
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 73,
                    ),
                    Container(
                      height: _height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: AppColors.red,
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(color: AppColors.darkGrey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Name';
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: _height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: AppColors.red,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: AppColors.darkGrey),
                            border: InputBorder.none,
                            // filled: true
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Email';
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: _height * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: AppColors.red,
                          controller: passController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: AppColors.darkGrey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Password';
                            }
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppStrings.alreadyAccount,
                              style: TextStyle(fontSize: 14),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: GestureDetector(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await authProvider.createUser(
                                email: emailController.text,
                                password: passController.text,
                                context: context,
                                username: nameController.text);
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: _height * 0.06,
                          decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                              child: authProvider.isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      AppStrings.signup,
                                      style: TextStyle(
                                          color: AppColors.white, fontSize: 20),
                                    )),
                        ),
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 136.0),
                      child: Text(
                        AppStrings.account,
                        style: TextStyle(fontSize: 14),
                      ),
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
                                borderRadius: BorderRadius.circular(24)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image(
                                  image:
                                      AssetImage('assets/logo/GoogleLogo.png')),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: _width * 0.2,
                            height: _height * 0.08,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image(
                                  image: AssetImage(
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
        ),
      ),
    );
  }
}
