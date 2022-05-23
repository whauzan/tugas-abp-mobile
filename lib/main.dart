import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tugas Pendahuluan'),
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: const MyBodyWidget(),
    );
  }
}

class MyBodyWidget extends StatefulWidget {
  const MyBodyWidget({Key? key}) : super(key: key);

  @override
  State<MyBodyWidget> createState() => _MyBodyWidgetState();
}

class _MyBodyWidgetState extends State<MyBodyWidget> {
  final TextEditingController myController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: myController,
            decoration: const InputDecoration(hintText: 'Masukkan Namamu'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Nama haruslah diisi';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Text('Selamat Datang ${myController.text}'),
                      );
                    },
                  );
                }
              },
              child: const Text('Lanjut'),
            ),
          ),
        ],
      ),
    );
  }
}
