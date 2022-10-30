import 'package:flutter/material.dart';
import 'package:buddy/globals.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';

class BuddyInfoPage extends StatefulWidget {
  const BuddyInfoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _buddyInfoPageState();
}

// ignore: camel_case_types
class _buddyInfoPageState extends State<BuddyInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    ////////////////////////////////////////////////////////////////////////////  App Bar
      appBar: AppBar(
      backgroundColor:global.white,
      elevation: 0,
      iconTheme: IconThemeData(color:global.blue),
      ),

      //////////////////////////////////////////////////////////////////////////  Floating Button

      floatingActionButton: InkWell(
        splashColor: Colors.white,
        onLongPress: () {},
        child: FloatingActionButton(
          elevation: 20,
          backgroundColor: Colors.white,
          child: const Icon(Icons.message_rounded, color: Colors.lightGreen,),
          onPressed: (){},
        ),
      ),

    ////////////////////////////////////////////////////////////////////////////  Drawer
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "\n\n\nSettings",
                style: TextStyle(color:global.white,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Change User Info",
                style: TextStyle(color:global.black,
                  fontFamily: 'Urbanist',
                  //fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                _authDialog(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: global.white,

    ////////////////////////////////////////////////////////////////////////////  Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(global.radius),
                  ),
                  color: global.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Center(
                          child: Icon(Icons.person_pin, color: Colors.white, size: 160,)
                      ),
                      const SizedBox(height: 140,),
                      Center(
                        child: Text(global.USN, style: TextStyle(color:global.white, fontFamily: 'Urbanist', fontWeight: FontWeight.w700,fontSize: 26,),),
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      Column(
                        children: const [
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////   Authentication Dialogue

  Future _authDialog(context) {
    return showDialog(
        context: context,
        builder:(BuildContext context){
          return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 20,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(global.radius),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    /*Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      onChanged: (value) => global.passkey = value,
                      style: const TextStyle(color: Colors.transparent),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        fillColor: Colors.white,
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.redAccent, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Enter Passkey',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: null,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),*/
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: TextField(
                        onChanged: (value) => global.USN = value,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          fillColor: Colors.white,
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.redAccent, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'USN',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: null,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: MaterialButton(
                        onPressed: () {
                          //checkPassKey();
                          setState((){
                            global.USN;
                          });
                          _setSharedPref();
                          Navigator.pop(context);
                        },
                        color: Colors.redAccent.shade400,
                        child: const Text(
                          "Validate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }
  Future<void> _setSharedPref() async {
    final prefs = await SharedPreferences.getInstance();                           //Here
    await prefs.setString('USN', global.USN);

  }

}