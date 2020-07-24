import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

Future<UserInfo> getUser() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final uid = user.uid;
  final info = Firestore.instance
      .collection('users')
      .where("uid", isEqualTo: uid)
      .limit(1)
      .snapshots();

  if (uid != null && info != null) {
    info.listen((event) {
      print('name: ' + event.documents[0]['name']);
      return UserInfo(
        name: event.documents[0]['name'],
        uid: event.documents[0]['uid'],
      );
    });
    return UserInfo(name: info.listen((event) {
      event.documents[0]['name'].toString();
    }));
  } else {
    print('error: can not get uid');
  }
}

Future<UserInfo> getData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final uid = user.uid;
  final docSnapshot = await Firestore.instance
      .collection('users')
      .where("uid", isEqualTo: uid)
      .limit(1)
      .getDocuments();
  print(docSnapshot.documents[0]['access']['event']);
  return UserInfo(
      name: docSnapshot.documents[0]['name'],
      uid: docSnapshot.documents[0]['uid'],
      event: docSnapshot.documents[0]['access']['event']);
}

class UserInfo {
  final name;
  final uid;
  final event;
  UserInfo({this.name, this.uid, this.event});
}

class HomePageState extends State<HomePage> {
  Future<UserInfo> user;
  var name;

  @override
  void initState() {
    super.initState();
    user = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ログイン後'),
        ),
        body: Container(
          child: FutureBuilder(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('name: ' + snapshot.data.name.toString());
                  print('uid: ' + snapshot.data.uid.toString());
                  print('event: ' + snapshot.data.event.toString());
                  return Text(snapshot.data.name.toString());
                } else {
                  return Container();
                }
              }),
        )
        // StreamBuilder<QuerySnapshot>(
        //   stream: Firestore.instance
        //       .collection('users')
        //       .where("uid", isEqualTo: uid)
        //       .snapshots(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.waiting:
        //         return Text('Loading...');
        //       default:
        //         final document = snapshot.data.documents.single.data;
        //         return Text(document['name']);
        //     }
        //   },
        // )
        );
  }
}
