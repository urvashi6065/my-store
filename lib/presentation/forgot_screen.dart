import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(backgroundColor: AppColors.grey,  leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back,size: 32,)),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.forgotPassword,style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
              SizedBox(height: 88),
              Text(AppStrings.forgotDis,style: TextStyle(fontSize: 14),),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  height: _height*0.09,
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
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Your Email';
                        }
                      },

                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 56.0),
                child: GestureDetector(
                  onTap: (){
                    if(formKey.currentState!.validate()){
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: _height*0.06,
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Center(child: Text(AppStrings.send,style: TextStyle(color: AppColors.white,fontSize: 20),)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
