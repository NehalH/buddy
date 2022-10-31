import 'package:buddy/attendance.dart';
import 'package:buddy/buddyInfo.dart';
import 'package:buddy/timeTable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'globals.dart' as global;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Buddy",
      initialRoute: '/home',
      routes: {
        //'/': (context) => const Splash_screen(),
        '/home': (context) => const MyHomePage(),
      },
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    _getSharedPref();
    super.initState();
  }

  int _selectedIndex = 0;
  bool authenticated = false;

  List<Widget> pageList = [
    const BuddyInfoPage(),
    const TimeTablePage(),
    const AttendancePage(),
    const AttendancePage(),
  ];


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //////////////////////////////////////////////////////////////////////////  Bottom Navigation Bar

      bottomNavigationBar: FlashyTabBar(
        backgroundColor: Colors.white,
        height: 65,
        iconSize: 18,
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.account_box),
            title: const Text('Buddy'),
            activeColor: Colors.green,
            inactiveColor: Colors.blue,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.calendar_month),
            title: const Text('Time Table'),
            activeColor: Colors.green,
            inactiveColor: Colors.blue,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.badge_rounded),
            title: const Text('Attendance'),
            activeColor: Colors.green,
            inactiveColor: Colors.blue,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.add_chart_rounded),
            title: const Text('CIE'),
            activeColor: Colors.green,
            inactiveColor: Colors.blue,
          ),
        ],
      ),

      //////////////////////////////////////////////////////////////////////////    Body

      body: pageList.elementAt(_selectedIndex),
    );
  }


  //////////////////////////////////////////////////////////////////////////////   Auth functions

  Future<void> _setSharedPref() async {
    final prefs = await SharedPreferences.getInstance();                           //Here
    await prefs.setString('USN', global.USN);

  }

  Future<void> _getSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      /*authenticated = storedPasskey == 'nehal';
      if(authenticated){

        global.userKundali =
            FirebaseFirestore
                .instance
                .collection('participants');

      }*/
      global.USN = prefs.getString('USN') ?? ' ';
      global.name = prefs.getString('name') ?? ' ';
      global.count[0]= (prefs.getInt('ele0')) ?? 0;
      global.count[1]= (prefs.getInt('ele1')) ?? 0;
      global.count[2]= (prefs.getInt('ele2')) ?? 0;
      global.count[3]= (prefs.getInt('ele3')) ?? 0;
      global.count[4]= (prefs.getInt('ele4')) ?? 0;
      global.count[5]= (prefs.getInt('ele5')) ?? 0;
      global.count[6]= (prefs.getInt('ele6')) ?? 0;
      global.count[7]= (prefs.getInt('ele7')) ?? 0;
      global.count[8]= (prefs.getInt('ele8')) ?? 0;
      global.count[9]= (prefs.getInt('ele9')) ?? 0;

      global.subs= (prefs.getStringList('subs')) ?? ['-','-','-','-','-','-','-','-','-','-'];

      global.dates[0]= (prefs.getStringList('dates0')) ?? ['-'];
      global.dates[1]= (prefs.getStringList('dates1')) ?? ['-'];
      global.dates[2]= (prefs.getStringList('dates2')) ?? ['-'];
      global.dates[3]= (prefs.getStringList('dates3')) ?? ['-'];
      global.dates[4]= (prefs.getStringList('dates4')) ?? ['-'];
      global.dates[5]= (prefs.getStringList('dates5')) ?? ['-'];
      global.dates[6]= (prefs.getStringList('dates6')) ?? ['-'];
      global.dates[7]= (prefs.getStringList('dates7')) ?? ['-'];
      global.dates[8]= (prefs.getStringList('dates8')) ?? ['-'];
      global.dates[9]= (prefs.getStringList('dates9')) ?? ['-'];
    });
  }

/*  void checkPassKey() {
    final String enteredPassKey = global.passkey;
    if (enteredPassKey == 'nehal') {                                             //And Here
      setState(() {
        authenticated = true;
        super.setState(() {});
      });
      _setPassKEYSharedPref();
    }
  }*/

}
