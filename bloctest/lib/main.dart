import 'package:flutter/material.dart';
import 'package:bloctest/viewmodel.dart';
void main() => runApp(BlocApp());

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprendendo BLoC',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
