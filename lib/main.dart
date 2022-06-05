import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP14 - 1301191313',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> seeAlert() async {
      AlertDialog alert = AlertDialog(
        title: const Text("Button clicked"),
        content: const Text("Button is clicked."),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK", style: TextStyle(color: Colors.black),))
        ],
      );
      showDialog(
          context: context,
          builder: (context) {
            return alert;
          });
    }

    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        child: const Text("Button"),
        onPressed: seeAlert,
      ),
    );
  }
}