import 'package:flutter/material.dart';
import './wordlist.dart';

void main() {
  runApp(MaterialApp(
    title: "Awesome app",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("App bar")),
        body: Center(
      child: Wordlist(),
    ));
  }
}
