import 'package:flutter/material.dart';

class WorkoutInfo extends StatelessWidget {
  const WorkoutInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF390094),
            Color(0xF9E90094),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Work out',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: 130.0,
                height: 130.0,
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: const [
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text('workout task',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
