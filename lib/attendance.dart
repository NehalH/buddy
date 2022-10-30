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
          padding: const EdgeInsets.all(30),
          child: Scrollable(
            viewportBuilder: (BuildContext context, ViewportOffset position) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///###########################################################
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                            onDoubleTap: ((){
                              global.current= 0;                              ///#
                              setSub(context);
                            }),
                            child:Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(global.attRadius),
                              ),
                              elevation: 10,
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(global.subs[0]),              ///#
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
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[0] =                         ///#
                                          minus(global.count[0]);               ///#
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
                                  Text(" ${global.count[0]}",                   ///#
                                      style: const TextStyle(fontSize: 40.0)),
                                  Text(" (${(50-global.count[0])/50*100}%) ",   ///#
                                      style: TextStyle(fontSize: 20.0,
                                      color: global.attPer,
                                      ),
                                  ),
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[0] =                         ///#
                                          plus(global.count[0]);                ///#

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
    );
  }

  int plus(int n) {
    setState(() {
      n++;
    });
    askWhy(context);
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

    await prefs.setStringList('subs', global.subs);

    await prefs.setStringList("dates", global.dates as List<String>);
  }

  Future setSub(context){
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: TextField(
                        onChanged: (value) => global.subs[global.current] = value,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Subject Acronym',
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
                            global.subs[global.current];
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

  Future askWhy(context){
    final now = DateTime.now();
    global.dates[global.current].add(DateTime(now.year, now.month, now.day) as String);
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: TextField(
                    //onChanged: (value) => global.USN = value,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'Reason (optional)',
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
                      setState((){
                      });
                      _setSharedPref();
                      Navigator.pop(context);
                    },
                    color: Colors.redAccent.shade400,
                    child: const Text(
                      "Enter",
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

}
