import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
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
                    Text('# of cups:', style: TextStyle(fontSize: 26.0)),
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
                  child: const Text('Add'),
                  onPressed: change,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Subtract'),
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
