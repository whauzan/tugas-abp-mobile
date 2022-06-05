import 'package:flutter/material.dart';

class DataModel {
  final String name, desc;
  DataModel(this.name, this.desc);
}

class DataDetail extends StatelessWidget {
  final DataModel dataModel;
  const DataDetail({Key? key, required this.dataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataModel.name),
      ),
      body: Column(
        children: [
          Text(
            dataModel.desc,
            style: const TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}

class Todos extends StatefulWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  static List<String> data = [
    'Todo 0',
    'Todo 1',
    'Todo 2',
    'Todo 3',
    'Todo 4',
    'Todo 5',
    'Todo 6',
    'Todo 7',
    'Todo 8'
  ];
  final List<DataModel> Data = List.generate(
    data.length,
    (index) => DataModel(data[index],
        'a description of what needs to be done for ${data[index]} '),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: Data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(Data[index].name),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DataDetail(
                      dataModel: Data[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Todos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Todos()),
                );
              },
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              child: const Text('Open Route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}