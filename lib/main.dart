import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_profile/pages/doctor_profile/doctor_profile_page.dart';
import 'package:medical_profile/pages/doctor_registration/doctor_registration_page.dart';
import 'package:medical_profile/pages/patient_profile/patient_profile_page.dart';
import 'package:medical_profile/pages/launcher_page.dart';
import 'package:medical_profile/pages/login_page.dart';
import 'package:medical_profile/pages/new_disease_page.dart';
import 'package:medical_profile/pages/patient_registration/patient_registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LauncherPage(),
      routes: {
        LauncherPage.routeName : (context) => LauncherPage(),
        LoginPage.routeName : (context) => LoginPage(),
        PatientProfilePage.routeName : (context) => PatientProfilePage(),
        DoctorProfilePage.routeName : (context) => DoctorProfilePage(),
        NewDiseasePage.routeName : (context) => NewDiseasePage(),
        PatientRegistration.routeName : (context) => PatientRegistration(),
        DoctorRegistration.routeName : (context) => DoctorRegistration(),
      },
    );
  }
}

