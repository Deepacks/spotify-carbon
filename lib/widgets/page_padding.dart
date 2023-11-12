import 'package:flutter/material.dart';

class PagePadding extends StatelessWidget {
  final Widget child;

  const PagePadding(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
