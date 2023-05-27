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
    final genderController = TextEditingController();
    final smokerController = TextEditingController();
    final hbCountController = TextEditingController();
    final SystolicBPController = TextEditingController();
    final DiastolicBPController = TextEditingController();
    final BMIController = TextEditingController();

    void handle() {
      final age = ageController.value.text;
      final gender = genderController.value.text;
      final smoker = smokerController.value.text;
      final hb = hbCountController.value.text;
      final systolicBP = SystolicBPController.value.text;
      final DiastolicBP = DiastolicBPController.value.text;
      final BMI = BMIController.value.text;

      final db = FirebaseFirestore.instance.collection('doctor').doc();
      db.set({
        'age': age,
        'gender': gender,
        'smoker': smoker,
        'hb': hb,
        'systolicBP': systolicBP,
        'diastolicBP': DiastolicBP,
        'bmi': BMI
      });
    }

    ;

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              hintText: 'Age',
            ),
          ),
          TextField(
            controller: genderController,
            decoration: InputDecoration(
              hintText: 'Gender',
            ),
          ),
          TextField(
            controller: smokerController,
            decoration: InputDecoration(
              hintText: 'Smoker',
            ),
          ),
          TextField(
            controller: hbCountController,
            decoration: InputDecoration(
              hintText: 'Hb Count',
            ),
          ),
          TextField(
            controller: SystolicBPController,
            decoration: InputDecoration(
              hintText: 'Systolic BP',
            ),
          ),
          TextField(
            controller: DiastolicBPController,
            decoration: InputDecoration(
              hintText: 'Diastolic BP',
            ),
          ),
          TextField(
            controller: BMIController,
            decoration: InputDecoration(
              hintText: 'BMI',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                handle();
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}
