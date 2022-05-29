import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'TP13 - 1301191313',
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(),
      '/first': (context) => const FirstRoute(judul: 'Tubes 1', desc: 'Website with Laravel'),
      '/second': (context) => const SecondRoute(judul: 'Tubes 2', desc: 'Mobile App with Flutter'),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text("Tubes 1",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  )),
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Tubes 2",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  )),
              leading: const CircleAvatar(backgroundColor: Colors.orange),
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key, required this.judul, required this.desc}) : super(key: key);
  final String judul, desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "$judul \n\n",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                )),
            TextSpan(
                text: desc,
                style: const TextStyle(height: 0, fontSize: 15, color: Colors.black)),
          ]),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key, required this.judul, required this.desc}) : super(key: key);
  final String judul, desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text:  TextSpan(children: [
            TextSpan(
                text: "$judul \n\n",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                )),
            TextSpan(
                text: desc,
                style: const TextStyle(height: 0, fontSize: 15, color: Colors.black)),
          ]),
        ),
      ),
    );
  }
}