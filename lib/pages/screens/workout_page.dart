import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkOutPage extends StatefulWidget {
  @override
  _WorkOutPageState createState() => _WorkOutPageState();
}

class _WorkOutPageState extends State<WorkOutPage> {
  final List<String> todoList = <String>[];
  final formkeyToDO = GlobalKey<FormState>();
  String textFieldController = '';
  final docWorkout = FirebaseFirestore.instance.collection('workouttodo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Workouts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('workouttodo').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];
                    return Center(
                      child: Card(
                          child: ListTile(
                        title: Text(doc['name']),
                      )),
                    );
                    ;
                  });
            } else {
              return Text("No data");
            }
          }),
      // body: StreamBuilder(
      //   stream: docWorkout.snapshots(),
      //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     print(snapshot);
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return Center(child: CircularProgressIndicator());
      //       default:
      //         if (snapshot.hasError) {
      //           return Text('Something Went Wrong Try later');
      //         } else {
      //           return ListView(
      //             children: snapshot.data!.docs.map((e) {
      //               return Center(
      //                 child: Card(
      //                     child: ListTile(
      //                   title: Text(e['workouttodo'] ?? 'does not exist'),
      //                 )),
      //               );
      //             }).toList(),
      //           );
      //         }
      //     }
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayDialog(context),
        child: const Icon(Icons.add),
        tooltip: 'Add Item',
      ),
    );
  }

  void addToArray(String title) {
    docWorkout.add({'name': title});
  }

  Future<AlertDialog> displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a workout to your List'),
            content: TextFormField(
              onChanged: (value) {
                textFieldController = value.toString().trim();
              },
              decoration: const InputDecoration(
                hintText: 'Enter task here',
                border: OutlineInputBorder(),
                labelText: 'Enter Task',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  addToArray(textFieldController);
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }).then((value) => value ?? false);
  }
}
