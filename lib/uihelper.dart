import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class uihelper{
  static CustomTextField(TextEditingController controller,String text,IconData iconData,bool toHide){
return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
  child: TextField(
    controller: controller,
    obscureText: toHide,
    decoration: InputDecoration(
      hintText: text,
      suffixIcon: Icon(iconData),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25)
      )
    ),
  ),
);
  }
  static CustomButton(voidCallback,String text){
    return SizedBox(height: 50, width: 300, child: ElevatedButton(onPressed: (){
      voidCallback();

    }, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25)
    )), child: Text(text,style:TextStyle(color: Colors.white,fontSize: 22)),
    ),);
  }

  static CustomAlerBox(BuildContext context, String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('ok'))
        ],
      );
    });
  }
}