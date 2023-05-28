import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'image.dart';

final ageController = TextEditingController();
final genderController = TextEditingController();
final smokerController = TextEditingController();
final hbCountController = TextEditingController();
final SystolicBPController = TextEditingController();
final DiastolicBPController = TextEditingController();
final BMIController = TextEditingController();
String? selectedSmoke;
String? selectedGender;
var imageUrl;
