import 'package:flutter/material.dart';

import '../login_page.dart';

class DoctorProfilePage extends StatefulWidget {
  static final String routeName = '/doctor_profile';

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Profile Page', style: TextStyle(fontSize: 15),),

      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountName: new Container(
                  child: Text('Elizabeth Olsen', style: TextStyle(color: Colors.black),)
              ),
              accountEmail: new Container(
                  child: Text('elizabetholsen@gmail.com', style: TextStyle(color: Colors.black),)
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage:
                NetworkImage("https://images4.alphacoders.com/912/912726.jpg"),
              ),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.dashboard),
                onPressed: (){},
              ),
              title: Text('Dashboard'),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: (){},
              ),
              title: Text('Notifications'),
            ),

            SizedBox(height: 10,),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.place),
                onPressed: (){},
              ),
              title: Text('Branch'),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.history),
                onPressed: (){},
              ),
              title: Text('History'),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.settings),
                onPressed: (){},
              ),
              title: Text('Settings'),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.logout),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
              ),
              title: Text('Logout'),
            )


          ],
        ),
      ),

      body: Center(
        child: Text('Profile'),
      ),

    );
  }
}
