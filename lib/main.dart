import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Praktikum App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> data = <String>[
      "Wahyu",
      "Bagja",
      "Daffa",
      "Faza",
      "Tius",
    ];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(widget.title),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Home", style: TextStyle(fontSize: 7)),
                icon: Icon(Icons.home_filled, size: 25),
              ),
              Tab(
                child: Text("Account", style: TextStyle(fontSize: 7)),
                icon: Icon(Icons.business_center, size: 25),
              ),
              Tab(
                child: Text("Alarm", style: TextStyle(fontSize: 7)),
                icon: Icon(Icons.connect_without_contact, size: 25),
              ),
              Tab(
                child: Text("Power Off", style: TextStyle(fontSize: 7)),
                icon: Icon(Icons.power_off, size: 25),
              ),
              Tab(
                child: Text("Account", style: TextStyle(fontSize: 7)),
                icon: Icon(Icons.account_box_outlined, size: 25),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: (1 / 1),
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text("Test Praktikum"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  color: Colors.brown,
                  child: const Text('grid 1'),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.blue,
                  child: const Text('grid 2'),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.green,
                  child: const Text('grid 3'),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.black,
                  child: const Text('grid 4'),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.red,
                  child: const Text('grid 5'),
                ),
              ],
            ),
            ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int idx) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    border: Border.all(
                      color: Colors.black,
                      width: .5,
                    ),
                  ),
                  height: 50,
                  child: Center(child: Text(data[idx])),
                );
              },
            ),
            const Center(
              child: Text("Alarm Page"),
            ),
            const Center(
              child: Text("Power Off Page"),
            ),
            ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int idx) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    border: Border.all(
                      color: Colors.black,
                      width: .5,
                    ),
                  ),
                  height: 50,
                  child: Center(child: Text(data[idx])),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}