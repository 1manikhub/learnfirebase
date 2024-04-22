import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnfirebase/forgotpassword.dart';
import 'package:learnfirebase/homescreen.dart';
import 'package:learnfirebase/singup.dart';
import 'package:learnfirebase/uihelper.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControoler = TextEditingController();

  login(String email, String password)async{
    if(email=='' && password=='' ){
      return uihelper.CustomAlerBox(context, 'Enter Required Fields');

    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) =>
      Navigator.push(context, MaterialPageRoute(builder: (context)=> homes())));
      }
      on FirebaseAuthException catch(ex ){
        return uihelper.CustomAlerBox(context, ex.code.toString());

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          uihelper.CustomTextField(emailController, 'Email', Icons.mail, false),
          uihelper.CustomTextField(
              passwordControoler, 'password', Icons.password, true),
          SizedBox(height: 36,),
          uihelper.CustomButton(() {
            login(emailController.text.toString(), passwordControoler.text.toString());
          }, 'login'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Already have an Account??',style: TextStyle(fontSize: 20),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> sin() ));
                }, child: Text('sign up', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
              ],
            ),
          SizedBox(height: 20,),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotpassword()));
          }, child: Text('Forgot Password', style: TextStyle(fontSize: 20,),))
        ],
      ),
    );
  }
}
