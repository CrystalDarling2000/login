import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  createPatient() async {
    // final db = FirebaseFirestore.instance.collection('doc1').doc();
    // db.set({"Age": "21"});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
