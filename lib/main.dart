import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/home_view.dart';

void main() {
  Paint.enableDithering = true;
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// 75976a3f1c984aaa9eb0d9cb7df73a6d
// http://com.bytemeup.spotify_carbon

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xffCE1C32),
          onPrimary: Colors.white,
          secondary: Color(0xff672026),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.transparent,
          onBackground: Colors.white,
          surface: Color(0xff27252C),
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
