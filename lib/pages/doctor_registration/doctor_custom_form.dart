import 'package:flutter/material.dart';
import 'package:medical_profile/pages/doctor_profile/doctor_profile_page.dart';
import 'package:medical_profile/pages/patient_registration/patient_registration_page.dart';
import 'package:select_form_field/select_form_field.dart';
class DoctorCustomFormState extends StatefulWidget {

  @override
  _DoctorCustomFormStateState createState() => _DoctorCustomFormStateState();
}

class _DoctorCustomFormStateState extends State<DoctorCustomFormState> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Male';
  final List<Map<String, dynamic>> _gitems = [
    {
      'label': 'Male',
    },
    {
      'label': 'Female',
    },
    {
      'label': 'Others',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 20,),
                const Center(child: Text('(Fill out the form carefully for registration)')),

                TextFormField(
                  decoration: InputDecoration(
                    //icon: Icon(Icons.person),
                      hintText: 'Enter your first name',
                      labelText: 'First Name'
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    //icon: Icon(Icons.person),
                      hintText: 'Enter your last name',
                      labelText: 'Last Name'
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    //icon: Icon(Icons.phone),
                      hintText: 'Enter your phone number',
                      labelText: 'Phone'
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    //icon: Icon(Icons.email),
                      hintText: 'Enter your email adress',
                      labelText: 'Email'
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    //icon: Icon(Icons.email),
                      hintText: 'Enter your id',
                      labelText: 'Doctor id'
                  ),
                ),


                TextFormField(
                  decoration: InputDecoration(
                    //icon: Icon(Icons.location_on),
                      hintText: 'Enter your adress',
                      labelText: 'Adress'
                  ),
                ),

                SelectFormField(
                  type: SelectFormFieldType.dropdown,
                  initialValue: 'Male',
                  labelText: 'Gender',
                  items: _gitems,
                  onChanged: (val) => print(val),
                  onSaved: (val) => print(val),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent)),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, DoctorProfilePage.routeName);
                        },
                      ),
                    ),
                  ],
                ),

              ],
            ),
          )
      ),
    );
  }
}