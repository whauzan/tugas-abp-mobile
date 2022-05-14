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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Tugas Jurnal'),
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
  var anggota = [
    'Akmal Muhamad Faza',
    'Bagja 9102 Kurniawan',
    'Daffa Barin Tizad Riyadi',
    'Vincentius Arnold Fridolin',
    'Dimas Bayu Nugraha',
    'Wahyu Hauzan Rafi'
  ];

  Widget _loopingAnggota(anggota, int index) {
    return Container(
      height: 75.0,
      color: index % 2 == 0 ? Colors.blueGrey[100] : Colors.blueGrey[200],
      child: Row(
        children: <Widget>[
          Container(
            height: 55.0,
            width: 55.0,
            margin: const EdgeInsets.all(10.0),
            color: index % 2 == 0 ? Colors.blueGrey[300] : Colors.blueGrey[100],
            child: index % 3 == 0
                ? Stack(
                    children: <Widget>[
                      const Center(
                        child: Icon(Icons.account_circle, size: 50.0),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  )
                : index == 4
                    ? Stack(
                        children: <Widget>[
                          const Center(
                            child:
                                Icon(Icons.account_circle_outlined, size: 50.0),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.block_rounded,
                              color: Colors.red[700],
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: Icon(Icons.account_circle_outlined, size: 50.0),
                      ),
          ),
          Expanded(
            child: Text(
              '$anggota',
              style: TextStyle(
                  color: Colors.blueGrey[800], fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const Icon(
                Icons.group,
                size: 25.0,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                      border: Border.all(width: 3.0, color: Colors.black),
                    ),
                    height: 50,
                    width: 50,
                  ),
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Wahyu Hauzan Rafi',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '1301191313',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Anggota Tim',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 350.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: ListView(
                      children: <Widget>[
                        for (var item in anggota) _loopingAnggota(item, index++)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
