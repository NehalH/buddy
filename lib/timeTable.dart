import 'package:flutter/material.dart';
import 'globals.dart' as global;
class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _timeTablePageState();
}

// ignore: camel_case_types
class _timeTablePageState extends State<TimeTablePage> {

  var imageList = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ////////////////////////////////////////////////////////////////////////////  Body

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/TimeTable.jpeg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
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
          child: Icon(Icons.refresh_rounded, color: global.white, size: 30,),
          onPressed: (){},
        ),
      ),
    );
  }

}