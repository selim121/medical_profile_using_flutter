import 'package:flutter/material.dart';
import 'package:medical_profile/auth/firebase_auth_service.dart';
import 'package:medical_profile/pages/patient_profile/patient_profile_page.dart';
import 'package:medical_profile/pages/login_page.dart';

class LauncherPage extends StatefulWidget {
  static final String routeName = '/launcher';

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, (){
      if(FirebaseAuthService.currentUser == null){
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, PatientProfilePage.routeName);
      }
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}
