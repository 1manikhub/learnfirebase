/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:learnfirebases/ui_helper.dart';

class showdata extends StatefulWidget {
  const showdata({super.key});

  @override
  State<showdata> createState() => _showdataState();
}

class _showdataState extends State<showdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Data"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator();

            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text(snapshot.error.toString());
            }

            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text("${snapshot.data!.docs[index]["title"]}"),
                    subtitle: Text("${snapshot.data!.docs[index]["Email"]}"),
                  );
                });
          }),
    );
  }
}*/
/*-----mohit------------*/


/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// Assuming uihelper.dart is not relevant to this specific error

class showdata extends StatefulWidget {
  const showdata({super.key});

  @override
  State<showdata> createState() => _showdataState();
}

class _showdataState extends State<showdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('show data'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    // Access document data and handle potential missing fields
                    final document = snapshot.data!.docs[index];
                    final title = document['title'] ?? 'No Title';
                    final email = document['Email'] ?? 'No Email';

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          // Extract first character of document ID (assuming IDs start with a letter)
                          document.id.substring(0, 1).toUpperCase(),
                        ),
                      ),
                      title: Text(title),
                      subtitle: Text(email),
                    );
                  },
                  itemCount: snapshot.data!.docs.length, // Set itemCount for ListView
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.hasError.toString()}'));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
            return const Text('Unexpected State'); // Added a default return statement
          }),
    );
  }
}
*/





//import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnfirebase/uihelper.dart';

class showdata extends StatefulWidget {
  const showdata({super.key});

  @override
  State<showdata> createState() => _showdataState();
}

class _showdataState extends State<showdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('show data'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {

                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index+1}'),
                    ),
                        title: Text('${snapshot.data!.docs[index]['title']}'),
                  subtitle: Text('${snapshot.data! .docs[index]['Email']}'),
                  );
                });

              }
              else if(snapshot.hasError){
                return Center(child: Text('${snapshot.hasError.toString()}'),);
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text('hi');//uihelper.CustomAlerBox(context, 'hi');

          }
          ),
    );
  }
}

