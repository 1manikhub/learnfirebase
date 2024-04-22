import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/loginpage.dart';

class homes extends StatelessWidget {

  const homes({super.key});

  @override
  Widget build(BuildContext context) {
    logout()async{
      FirebaseAuth.instance.signOut().then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginpage()));
      }
      );
    }
    return  Scaffold(
      body: Column(
        children:[
            ElevatedButton(onPressed: (){
              logout();
            }, child: Text('click')),
          Text('hi'),
        ],
      ),
    );
  }
}
