import 'package:flutter/material.dart';

class SleepPage extends StatefulWidget {
  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  double val = 0;

  void change() {
    setState(() {
      val++;
    });
  }

  void subtractChange() {
    if (val >= 1) {
      setState(() {
        val--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Column(
                  children: [
                    Text('Sleeping Hours:', style: TextStyle(fontSize: 26.0)),
                    SizedBox(height: 20),
                    Text('$val', style: TextStyle(fontSize: 26.0))
                  ],
                ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('+', style: TextStyle(fontSize: 26.0)),
                  onPressed: change,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('-', style: TextStyle(fontSize: 30.0)),
                  onPressed: subtractChange,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
