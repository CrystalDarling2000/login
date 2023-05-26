import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance.collection('doctor');
    final ageController = TextEditingController();

     void  handle(){
      final age = ageController.value.text;
      final db = FirebaseFirestore.instance.collection('doctor').doc();
      db.set({'age':age});
  };

    return Scaffold(body: Column(children: [
      TextField(
        controller:ageController,
        decoration: InputDecoration(hintText: 'Age',),),
        ElevatedButton(onPressed: (){
          handle();
        }, child: Text('Submit'))
    ],),
    );
  }
}
