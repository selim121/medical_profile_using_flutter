import 'package:flutter/material.dart';
import 'package:medical_profile/pages/login_page.dart';
import 'package:medical_profile/pages/patient_profile/history_page.dart';
import 'package:medical_profile/pages/patient_profile/home_page.dart';
import 'package:medical_profile/utils/search_button.dart';

class PatientProfilePage extends StatefulWidget {
  static final String routeName = '/patient_profile';

  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  TabBar get _tabBar => TabBar(
    tabs: [
      Tab(icon: Icon(Icons.home),text: 'Home',),
      Tab(icon: Icon(Icons.history), text: 'History',),
    ],
  );

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: const Text('Profile Page', style: TextStyle(fontSize: 15),),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                color: Colors.blueGrey,
                child: _tabBar,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const SearchPage())),
                  icon: Icon(Icons.search)
              ),
            ],
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
                    AssetImage('photos/ElizabethOlsen.jpg'),
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

          body: const TabBarView(
            children: [
              HomePage(),
              HistoryPage(),
            ],
          ),



        ),
      ),
    );
  }
}
