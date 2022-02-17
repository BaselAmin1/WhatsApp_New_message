import 'package:flutter/material.dart';
import 'package:new_message_for_whatsapp/whats_app.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: whats_app(),
    );
  }
}