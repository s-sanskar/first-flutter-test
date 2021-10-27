import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaloriesPage extends StatefulWidget {
  @override
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  final formkeyCal = GlobalKey<FormState>();
  bool isloading = false;
  double cal = 0;
  double val = 0;
  void submitCal() async {
    setState(() {
      val += cal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Form(
            key: formkeyCal,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Column(
                      children: [
                        Text('Manage Calories:',
                            style: TextStyle(fontSize: 26.0)),
                        SizedBox(height: 20),
                        Text('$val', style: TextStyle(fontSize: 26.0))
                      ],
                    ))),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter some number";
                        }
                      },
                      onChanged: (value) => cal = double.parse(value),
                      keyboardType: TextInputType.number,
                    )),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: submitCal,
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
