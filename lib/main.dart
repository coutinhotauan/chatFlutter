import 'package:chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  runApp(const MyApp());

  /*
  //await Firebase.initializeApp();
  if(Firebase.apps.isEmpty){
    await Firebase.initializeApp();
  }
  //escrevendo no banco
  //FirebaseFirestore.instance.collection('col').doc().set({"texto":"teste"});


  FirebaseFirestore.instance.collection('col').snapshots().listen((event) {
    event.docs.forEach((element) {
      print(element.data());
    });
  });
  */

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.blue,
        )
      ),
      home: ChatScreen(),
    );
  }
}

