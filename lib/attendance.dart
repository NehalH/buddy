import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as global;
import 'globals.dart';
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
                  ///########################################################### 0
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onDoubleTap: (() {
                            global.current = 0;

                            ///#
                            global.tempDates= dates[current];

                            setSub(context);
                          }),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 10,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(global.subs[0]),

                                  ///#
                                )),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[0] =

                                          ///#
                                          minus(global.count[0]);

                                      ///#
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
                                  Text(" ${global.count[0]}",

                                      ///#
                                      style: const TextStyle(fontSize: 40.0)),
                                  Text(
                                    " (${(50 - global.count[0]) / 50 * 100}%) ",

                                    ///#
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: global.attPer,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[0] =

                                          ///#
                                          plus(global.count[0]);

                                      ///#
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
                            )),
                        Container(
                          child: InkWell(
                            onTap: (() {
                              showWhen(context);
                            }),
                            child: Icon(
                              Icons.info_rounded,
                              color: global.blue,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///########################################################### 1
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onDoubleTap: (() {
                            global.current = 1;

                            ///#
                            global.tempDates= dates[current];

                            setSub(context);
                          }),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 10,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(global.subs[1]),

                                  ///#
                                )),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[1] =

                                      ///#
                                      minus(global.count[1]);

                                      ///#
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
                                  Text(" ${global.count[1]}",

                                      ///#
                                      style: const TextStyle(fontSize: 40.0)),
                                  Text(
                                    " (${(50 - global.count[1]) / 50 * 100}%) ",

                                    ///#
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: global.attPer,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[1] =

                                      ///#
                                      plus(global.count[1]);

                                      ///#
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
                            )),
                        Container(
                          child: InkWell(
                            onTap: (() {
                              showWhen(context);
                            }),
                            child: Icon(
                              Icons.info_rounded,
                              color: global.blue,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///########################################################### 2
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onDoubleTap: (() {
                            global.current = 2;

                            ///#
                            global.tempDates= dates[current];

                            setSub(context);
                          }),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 10,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(global.subs[2]),

                                  ///#
                                )),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[2] =

                                      ///#
                                      minus(global.count[2]);

                                      ///#
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
                                  Text(" ${global.count[2]}",

                                      ///#
                                      style: const TextStyle(fontSize: 40.0)),
                                  Text(
                                    " (${(50 - global.count[2]) / 50 * 100}%) ",

                                    ///#
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: global.attPer,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[2] =

                                      ///#
                                      plus(global.count[2]);

                                      ///#
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
                            )),
                        Container(
                          child: InkWell(
                            onTap: (() {
                              showWhen(context);
                            }),
                            child: Icon(
                              Icons.info_rounded,
                              color: global.blue,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///########################################################### 3
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onDoubleTap: (() {
                            global.current = 3;

                            ///#
                            global.tempDates= dates[current];

                            setSub(context);
                          }),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 10,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(global.subs[3]),

                                  ///#
                                )),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[3] =

                                      ///#
                                      minus(global.count[3]);

                                      ///#
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
                                  Text(" ${global.count[3]}",

                                      ///#
                                      style: const TextStyle(fontSize: 40.0)),
                                  Text(
                                    " (${(50 - global.count[3]) / 50 * 100}%) ",

                                    ///#
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: global.attPer,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[3] =

                                      ///#
                                      plus(global.count[3]);

                                      ///#
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
                            )),
                        Container(
                          child: InkWell(
                            onTap: (() {
                              showWhen(context);
                            }),
                            child: Icon(
                              Icons.info_rounded,
                              color: global.blue,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///########################################################### 4
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onDoubleTap: (() {
                            global.current = 4;

                            ///#
                            global.tempDates= dates[current];

                            setSub(context);
                          }),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 10,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(global.subs[4]),

                                  ///#
                                )),
                          ),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(global.attRadius),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[4] =

                                      ///#
                                      minus(global.count[4]);

                                      ///#
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
                                  Text(" ${global.count[4]}",

                                      ///#
                                      style: const TextStyle(fontSize: 40.0)),
                                  Text(
                                    " (${(50 - global.count[4]) / 50 * 100}%) ",

                                    ///#
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: global.attPer,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    elevation: 2,
                                    mini: true,
                                    onPressed: (() {
                                      global.count[4] =

                                      ///#
                                      plus(global.count[4]);

                                      ///#
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
                            )),
                        Container(
                          child: InkWell(
                            onTap: (() {
                              showWhen(context);
                            }),
                            child: Icon(
                              Icons.info_rounded,
                              color: global.blue,
                              size: 40,
                            ),
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

    await prefs.setStringList('dates0', global.dates[0]);
    await prefs.setStringList('dates1', global.dates[1]);
    await prefs.setStringList('dates2', global.dates[2]);
    await prefs.setStringList('dates3', global.dates[3]);
    await prefs.setStringList('dates4', global.dates[4]);
    await prefs.setStringList('dates5', global.dates[5]);
    await prefs.setStringList('dates6', global.dates[6]);
    await prefs.setStringList('dates7', global.dates[7]);
    await prefs.setStringList('dates8', global.dates[8]);
    await prefs.setStringList('dates9', global.dates[9]);
  }

  Future setSub(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
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
                        onChanged: (value) =>
                            global.subs[global.current] = value,
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
                          setState(() {
                            global.subs[global.current];
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
              ));
        });
  }

  Future askWhy(context) {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: TextField(
                        //onChanged: (value) => global.USN = value,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: MaterialButton(
                            onPressed: () async{
                              setState((){
                                global.count[current] = minus(global.count[current]);
                              });
                              Navigator.pop(context);
                            },
                            color: Colors.blueAccent,
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: MaterialButton(
                            onPressed: () async{
                              tempDates.add('${DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)}');
                              dates[current]= tempDates as List<String>;
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
                  ],
                ),
              ));
        });
  }

  Future showWhen(context) async{
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 20,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(global.radius),
              ),
              child: Scrollable(
                viewportBuilder:
                    (BuildContext context, ViewportOffset position) {
                  return ListView.builder(
                      itemCount: tempDates.length,//dates[current].length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text(tempDates[index]));
                      });
                },
              ),
            ),
          );
        });
  }

}
