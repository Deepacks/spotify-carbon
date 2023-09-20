import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentHour = now.hour;

    String greeting = '';

    if (currentHour >= 6 && currentHour < 13) {
      greeting = 'Good morning';
    } else if (currentHour >= 13 && currentHour < 18) {
      greeting = 'Good afternoon';
    } else if (currentHour >= 18 && currentHour < 23) {
      greeting = 'Good evening';
    } else {
      greeting = 'Good night';
    }

    return Text(
      greeting,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
