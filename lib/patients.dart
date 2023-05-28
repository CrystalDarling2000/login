import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'image.dart';
import 'main.dart';
import 'data.dart';

import 'package:flutter/material.dart';

class GenderDropdownButton extends StatefulWidget {
  @override
  _GenderDropdownButtonState createState() => _GenderDropdownButtonState();
}

class _GenderDropdownButtonState extends State<GenderDropdownButton> {
  List<String> genderList = [
    'Male',
    'Female',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      decoration: InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
      ),
      onChanged: (newValue) {
        setState(() {
          selectedGender = newValue!;
        });
      },
      items: genderList.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
    );
  }
}

class SmokeDropdownButton extends StatefulWidget {
  @override
  _SmokeDropdownButtonState createState() => _SmokeDropdownButtonState();
}

class _SmokeDropdownButtonState extends State<SmokeDropdownButton> {
  List<String> SmokeList = [
    'Yes',
    'No',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedSmoke,
      decoration: InputDecoration(
        labelText: 'Smoker',
        border: OutlineInputBorder(),
      ),
      onChanged: (newValue) {
        setState(() {
          selectedSmoke = newValue!;
        });
      },
      items: SmokeList.map((String smoker) {
        return DropdownMenuItem<String>(
          value: smoker,
          child: Text(smoker),
        );
      }).toList(),
    );
  }
}

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance.collection('doctor');

    void handle() {
      final age = ageController.value.text;
      final gender = selectedGender;
      final smoker = selectedSmoke;
      final hb = hbCountController.value.text;
      final systolicBP = SystolicBPController.value.text;
      final DiastolicBP = DiastolicBPController.value.text;
      final BMI = BMIController.value.text;

      final db = FirebaseFirestore.instance.collection('doctor').doc();
      imageUrl != null
          ? db.set({
              'age': age,
              'gender': gender,
              'smoker': smoker,
              'hb': hb,
              'systolicBP': systolicBP,
              'diastolicBP': DiastolicBP,
              'bmi': BMI,
              'url': imageUrl,
            })
          : db.set({
              'age': age,
              'gender': gender,
              'smoker': smoker,
              'hb': hb,
              'systolicBP': systolicBP,
              'diastolicBP': DiastolicBP,
              'bmi': BMI,
            });
    }

    goBack() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: 'Age',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              GenderDropdownButton(),
              SizedBox(
                height: 10,
              ),
              SmokeDropdownButton(),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: hbCountController,
                decoration: InputDecoration(
                  hintText: 'Hb Count',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: SystolicBPController,
                decoration: InputDecoration(
                  hintText: 'Systolic BP',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: DiastolicBPController,
                decoration: InputDecoration(
                  hintText: 'Diastolic BP',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: BMIController,
                decoration: InputDecoration(
                  hintText: 'BMI',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageUploaderWidget()));
                  },
                  child: Text('Image Upload')),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    handle();
                  },
                  child: Text('Submit')),
              ElevatedButton(
                  onPressed: () {
                    goBack();
                  },
                  child: Text('Go Back...'))
            ],
          ),
        ),
      ),
    );
  }
}
