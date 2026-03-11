import 'package:flutter/material.dart';
import 'conversor_page.dart';

void main() {
  runApp(const FlexConvertApp());
}

class FlexConvertApp extends StatelessWidget {
  const FlexConvertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexConvert',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ConversorPage(), 
    );
  }
}