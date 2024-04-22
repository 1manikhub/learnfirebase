import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/homescreen.dart';
import 'package:learnfirebase/uihelper.dart';

class sin extends StatefulWidget {
  const sin({super.key});

  @override
  State<sin> createState() => _sinState();
}

class _sinState extends State<sin> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passcontroller= TextEditingController();
  signup(String email,String password) async{
    if(email=='' && password==''){
      uihelper.CustomAlerBox(context, 'Enter Required Fields');
    }
    else
      {
        UserCredential? usercredential;
        try{
          usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => 
          Navigator.push(context, MaterialPageRoute(builder: (context)=>homes())));
          
        }
        on FirebaseAuthException catch(ex){
          return uihelper.CustomAlerBox(context, ex.code.toString());
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('singn up page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          uihelper.CustomTextField(emailcontroller, 'Email', Icons.mail, false),
          uihelper.CustomTextField(passcontroller, 'Password', Icons.password, true),
          SizedBox(height: 30,),
          uihelper.CustomButton((){
            signup(emailcontroller.text.toString(), passcontroller.text.toString());
          }, 'signup'),

        ],
      ) ,
    );
  }
}
