import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as global;
import 'main.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _attendancePageState();
}

// ignore: camel_case_types
class _attendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////////////////////////////////////////////////////////  Body

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Scrollable(
            viewportBuilder: (BuildContext context, ViewportOffset position) {
              return Column(
                children: [
                  ///###########################################################
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          //width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 10,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: InkWell(
                                  onLongPress: ((){

                                  }),
                                  child: Text("ATC"),
                                ),
                              )
                            ),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[0] = minus(global.count[0]);
                                    }),
                                    backgroundColor: global.blue,
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                  Text("${global.count[0]}",
                                      style: const TextStyle(fontSize: 40.0)),
                                  Text(" (${(50-global.count[0])/50*100}%)",
                                      style: const TextStyle(fontSize: 20.0)),
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[0] = plus(global.count[0]);

                                    }),
                                    backgroundColor: global.blue,
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Container(
                          child: InkWell(
                            onTap: ((){

                            }),
                            child: Icon(Icons.info_rounded, color: global.blue, size: 40,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ///###########################################################
                ],
              );
            },
          ),
        ),
      ),

      //////////////////////////////////////////////////////////////////////////  Floating Button

      floatingActionButton: InkWell(
        splashColor: Colors.white,
        onLongPress: () {},
        child: FloatingActionButton(
          elevation: 20,
          backgroundColor: global.blue,
          child: Icon(
            Icons.refresh_rounded,
            color: global.white,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  int plus(int n) {
    setState(() {
      n++;
    });
    _setSharedPref();
    return n;
  }

  int minus(int n) {
    setState(() {
      if (n != 0) {
        n--;
      }
    });
    _setSharedPref();
    return n;
  }

  Future<void> _setSharedPref() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('ele0', global.count[0]);
    await prefs.setInt('ele1', global.count[1]);
    await prefs.setInt('ele2', global.count[2]);
    await prefs.setInt('ele3', global.count[3]);
    await prefs.setInt('ele4', global.count[4]);
    await prefs.setInt('ele5', global.count[5]);
    await prefs.setInt('ele6', global.count[6]);
    await prefs.setInt('ele7', global.count[7]);
    await prefs.setInt('ele8', global.count[8]);
    await prefs.setInt('ele9', global.count[9]);
  }
}
