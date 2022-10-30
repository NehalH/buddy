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
    _getVarSharedPref();
    super.initState();
  }

  int _selectedIndex = 0;
  bool authenticated = false;

  List<Widget> pageList = [
    const BuddyInfoPage(),
    const TimeTablePage(),
    const BuddyInfoPage(),
    const BuddyInfoPage(),
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
            icon: const Icon(Icons.phone),
            title: const Text('Time Table'),
            activeColor: Colors.green,
            inactiveColor: Colors.blue,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.dashboard_rounded),
            title: const Text('Attendance'),
            activeColor: Colors.green,
            inactiveColor: Colors.blue,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.badge),
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

  Future<void> _setPassKEYSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    // It doesn't make much sense imho, better use a boolean
    await prefs.setString('passKEY', 'nehal');                                   //Here
    await prefs.setString('signature', global.USN);
  }

  Future<void> _getVarSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final storedPasskey = prefs.getString('passKEY') ?? 'Not_yet_authorised';
    global.USN = prefs.getString('signature')!;
    setState(() {
      authenticated = storedPasskey == 'nehal';
/*      if(authenticated){

        global.userKundali =
            FirebaseFirestore
                .instance
                .collection('participants');

      }*/
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
