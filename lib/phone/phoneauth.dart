import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/phone/otpscreen.dart';

class phoneaut extends StatefulWidget {
  const phoneaut({super.key});

  @override
  State<phoneaut> createState() => _phoneautState();
}

class _phoneautState extends State<phoneaut> {
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('phone Auth'),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: phonecontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Enter phone number",
                //suffixIcon: Icon(Icon.ph),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verification, int? resendtoken) {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> otps(verification: verification ,)) );
                  },
                  codeAutoRetrievalTimeout: (String verification) {},
                  phoneNumber: phonecontroller.text.toString());
            },
            child: Text('Vwrify phone number'))
      ]),
    );
  }
}
