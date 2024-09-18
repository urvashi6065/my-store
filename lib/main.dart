import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mystore/presentation/electronics.dart';

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
        ChangeNotifierProvider(create: (context)=>ProductProvider())
     ],
     child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SignUp(),
          ),
   );
  }
}

