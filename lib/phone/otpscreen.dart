import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/homescreen.dart';
import 'package:learnfirebase/uihelper.dart';

class otps extends StatefulWidget {
  String verification;
  otps({super.key, required this.verification});

  @override
  State<otps> createState() => _otpsState();
}

class _otpsState extends State<otps> {
  TextEditingController otpcontrooler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('otp screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpcontrooler,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: 'Enter the OTP',
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verification,
                          smsCode: otpcontrooler.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> homes()));
                  });
                } catch (ex) {
                 // uihelper.CustomAlerBox(context, ex.toString());
                 // log(ex.toString());

                 // log(ex.toString());
                }
              },
              child: Text('OTP'))
        ],
      ),
    );
  }
}
