import 'package:flutter/material.dart';

import 'greeting.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 20),
        Greeting(),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
