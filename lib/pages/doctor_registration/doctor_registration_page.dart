import 'package:flutter/material.dart';
import 'doctor_custom_form.dart';

class DoctorRegistration extends StatefulWidget {
  static final String routeName = '/doctor_register';

  @override
  _DoctorRegistrationState createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Registration as a doctor',style: TextStyle(color: Colors.black),),
      ),
      body: DoctorCustomFormState(),
    );
  }
}

