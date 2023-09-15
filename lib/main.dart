import 'package:flutter/material.dart';

import 'package:spotiflutter/spotiflutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _spotiflutter = Spotiflutter((_) {});

  bool _isConnected = false;

  @override
  void didChangeDependencies() async {
    _isConnected = await _spotiflutter.isConnected ?? false;
    if (!_isConnected) _spotiflutter.connect();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Placeholder(),
        ),
      ),
    );
  }
}
