import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mystore/core/Provider/logic/logic_provider.dart';
import 'package:mystore/core/Provider/logout/logout_provider.dart';
import 'package:mystore/dash_board/bottomNavigation.dart';
import 'package:mystore/presentation/electronics.dart';
import 'package:mystore/presentation/forgot_screen.dart';
import 'package:mystore/presentation/home/home_screen/home_screen.dart';

import 'package:mystore/presentation/sign_up.dart';
import 'package:provider/provider.dart';

import 'core/Provider/auth/auth_provider.dart';
import 'core/Provider/category/category_provider.dart';
import 'core/Provider/product/product_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   return  MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context)=>AthProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>LogicProvider()),
        ChangeNotifierProvider(create: (context)=>LogoutProvider()),
     ],
     child: Consumer<LogicProvider>(
       builder: (context,value,child) {
         return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: ForgotScreen(),
                // hom: value.currentUser() ? const BottomNavigation():const  SignUp(),
              );
       }
     ),
   );
  }
}

