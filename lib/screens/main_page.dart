import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String id = 'mainpage';
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
          
          },
          height: 50,
          color: Colors.green,
          minWidth: 100,
          child: Text('Test Connection'),
        ),
      ),
    );
  }
}
