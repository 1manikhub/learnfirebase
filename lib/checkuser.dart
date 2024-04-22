import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/homescreen.dart';
import 'package:learnfirebase/loginpage.dart';
import 'package:learnfirebase/main.dart';

class checkuser extends StatefulWidget {
  const checkuser({super.key});

  @override
  State<checkuser> createState() => _checkuserState();
}

class _checkuserState extends State<checkuser> {
  
  @override
  Widget build(BuildContext context) {
    return  loginpage();
  }
  /*checkuser() {
    final user= FirebaseAuth.instance.currentUser;
    if(user!= null){
      return homes();
    }
    else
      {
        return loginpage();
      }
  }*/
}
