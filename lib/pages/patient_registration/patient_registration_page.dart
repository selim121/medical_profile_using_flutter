import 'package:flutter/material.dart';
import 'package:medical_profile/pages/patient_registration/patient_custom_form.dart';

class PatientRegistration extends StatefulWidget {
  static final String routeName = '/patient_register';

  @override
  _PatientRegistrationState createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration as a patient',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.greenAccent,
      ),
      body: PatientCustomFormState(),
    );
  }
}
