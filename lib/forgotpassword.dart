import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/uihelper.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  TextEditingController emailcontroller =TextEditingController();
  forgotpassword(String email)async{
    if(email==''){
      return uihelper.CustomAlerBox(context, 'Enter an email to Reset password');    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          uihelper.CustomTextField(emailcontroller, 'Email', Icons.mail, false),
          SizedBox(height: 20,),
          uihelper.CustomButton((){
            forgotpassword(emailcontroller.text.toString());
          }, "Reset pass"),

        ],
      ),
    );
  }
}
