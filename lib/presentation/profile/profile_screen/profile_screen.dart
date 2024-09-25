import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/core/Provider/logout/logout_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Consumer<LogoutProvider>(
          builder: (context,value,child) {
            return ElevatedButton(onPressed: () {
              value.logOut();
            }, child: Text('Log Out'));
          }
        ),
      ),
    );
  }
}
