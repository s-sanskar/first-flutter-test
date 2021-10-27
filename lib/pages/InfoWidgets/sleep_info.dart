import 'package:flutter/material.dart';

class SleepInfo extends StatelessWidget {
  const SleepInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Sleep',
                style: TextStyle(fontSize: 26.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: 30.0,
                  height: 30.0,
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Hours',
          style: TextStyle(fontSize: 18.0),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '0',
            style: TextStyle(
              fontSize: 80.0,
              fontFamily: 'JosefinSans',
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              '/8',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'JosefinSans',
                color: Colors.black,
              ),
            ),
          ),
        ]),
        const SizedBox(width: 20),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Goal Achieved',
            style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
