import 'package:flutter/material.dart';
import 'package:lesson38/pages/forms_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormsPage(),
    );
  }
}
