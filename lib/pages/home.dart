import 'package:first_flutter_app/pages/screens/calories_page.dart';
import 'package:first_flutter_app/pages/InfoWidgets/calories_section.dart';
import 'package:first_flutter_app/pages/Components/section.dart';
import 'package:first_flutter_app/pages/InfoWidgets/sleep_info.dart';
import 'package:first_flutter_app/pages/screens/sleep_page.dart';
import 'package:first_flutter_app/pages/InfoWidgets/water_info.dart';
import 'package:first_flutter_app/pages/screens/water_page.dart';
import 'package:first_flutter_app/pages/InfoWidgets/workout_info.dart';
import 'package:first_flutter_app/pages/screens/workout_page.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      body: Stack(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Sections(
                            widthFull: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (contex) => SleepPage(),
                                  ),
                                );
                              },
                              child: const SleepInfo(),
                            ),
                          ),
                          Sections(
                            widthFull: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (contex) => WaterPage(),
                                  ),
                                );
                              },
                              child: const WaterInfo(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Sections(
                            widthFull: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (contex) => CaloriesPage(),
                                  ),
                                );
                              },
                              child: const CaloriesSection(),
                            ),
                          ),
                          Sections(
                              widthFull: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (contex) => WorkOutPage(),
                                    ),
                                  );
                                },
                                child: const WorkoutInfo(),
                              ))
                        ],
                      )
                    ]))))
      ]),
    );
  }
}
