import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int timer = 0;
  int timeStop = 10;
  bool buttonPush = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ポモドーロ'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('時間'),
            Text('$timer'),
          ],
        ),
      ),
      floatingActionButton: Ink(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          onPressed: () async {
            for (int i = 0; i < 10; i++) {
              buttonPush = true;
              await Future.delayed(Duration(seconds: 1));
              setState(() {
                timer++;
              });
            }
            buttonPush = false;
          },
          icon: buttonPush ? Icon(Icons.stop) : Icon(Icons.arrow_right),
          color: Colors.white,
        ),
      ),
    );
  }
}
