import 'dart:math';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnfirebase/uihelper.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  File? pickedImage;
signup(String email, String password)async{
  if(email=='' && password=='' && pickedImage==null)
 // if(email=='' && password='' && pickedimage==null)
  {
return showDialog(context: context, builder: (BuildContext context)
{
  return AlertDialog(
    title: Text('Enter Required fields'),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('ok'))
    ],
  );
});
  }
  else{

    UserCredential? usercredential;
    try{
      usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
     uploadData();

      });
    }
    on FirebaseAuthException catch(ex){
      print(ex.code.toString());
    }
  }

  }
  uploadData()async{
  UploadTask uploadTask= FirebaseStorage.instance.ref('profils pics'). child(emailcontroller.text.toString()).putFile(pickedImage!);
  TaskSnapshot taskSnapshot=await uploadTask;
  String url=await taskSnapshot.ref.getDownloadURL();
  FirebaseFirestore.instance.collection('users').doc(emailcontroller.text.toString()).set(
      {
        'Email': emailcontroller.text.toString(),
        'image':url
      }).then((value) {
        print('user uploaded');
  });
  }
  showAlertBox(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('pick image from'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

          ListTile(
            onTap: (){
              pickImage(ImageSource.camera);
              Navigator.pop(context);
            },
            leading: Icon(Icons.camera_alt),
            title: Text('camera'),
          ),
          ListTile(
            onTap: (){
              pickImage(ImageSource.gallery);
              Navigator.pop(context);

            },
            leading: Icon(Icons.image),
            title: Text('Gallery'),
          ),
        ],),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('sign up page'),
        centerTitle: true,
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              showAlertBox();
            },
            child:pickedImage!= null? CircleAvatar(
              radius: 80,
            backgroundImage: FileImage(pickedImage!),
            //  child: Icon(Icons.person,size: 80,),
            ):CircleAvatar(
              radius: 80,
              child: Icon(Icons.person,size: 80,),
            )
          ),
          uihelper.CustomTextField(emailcontroller,'Email', Icons.mail, false),
          uihelper.CustomTextField(passwordcontroller, 'password', Icons.password, true),
          SizedBox(height: 20),
          uihelper.CustomButton((){
            signup(emailcontroller.text.toString(), passwordcontroller.text.toString());
          }, 'sign up')
        ],
      ),
    );
  }
  pickImage(ImageSource imageSource)async{
    try{
      final photo=await ImagePicker().pickImage(source: imageSource);
    if(photo==null) return;
    final tempImage=File(photo.path);
    setState(() {
      pickedImage=tempImage;
    });
    }
catch(ex){
      print(ex.toString());
}
  }
}
