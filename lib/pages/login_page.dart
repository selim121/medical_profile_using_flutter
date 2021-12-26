import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_profile/auth/firebase_auth_service.dart';
import 'package:medical_profile/pages/patient_registration/patient_registration_page.dart';
import 'package:medical_profile/utils/helper_function.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? email, password;
  bool isPasswordVisible = false;
  bool isLogin = true;
  final _formKey = GlobalKey<FormState> ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Welcome, User',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('photos/avatar.jpg'),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email), hintText: 'Emain Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Provide a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  obscureText: isPasswordVisible ? false : true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      hintText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Provide a valid password (min 6 char)';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text('REGISTER'),
                      onPressed: () {
                       // Navigator.pushReplacementNamed(context, PatientRegistration.routeName);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PatientRegistration()));
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          isLogin = true;
                          _authonticate();
                        },
                        child: Text('LOGIN')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _authonticate() async {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bool status = false;
      try{
        if(isLogin){
          status = await FirebaseAuthService.loginUser(email!, password!);
        }else{
          status = await FirebaseAuthService.registerUser(email!, password!);
        }

        if(status){
          Navigator.pushReplacementNamed(context, PatientRegistration.routeName);
        }
      } on FirebaseAuthException catch (e) {
        showMessage(context, e.message!);
      }

    }
  }
}
