import 'package:flutter/material.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Jurnal'),
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
  int _selectedId = 0;
  String dropdownValue = "Apple";
  String _selectedMenu = '';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Halaman kedua',
      style: optionStyle,
    ),
    const Text(
      'Halaman Ketiga',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedId = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tes Akhir'),
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<Menu>(
              // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item.name;
                });
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text("Pesan"),
                      content: Text("Anda memilih $_selectedMenu"),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, 'OK'), child: const Text("OK"))
                      ],
                    );
                  },
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem<Menu>(
                      value: Menu.itemOne,
                      child: Text('Item 1'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemTwo,
                      child: Text('Item 2'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemThree,
                      child: Text('Item 3'),
                    ),
                    const PopupMenuItem<Menu>(
                      value: Menu.itemFour,
                      child: Text('Item 4'),
                    ),
                  ])
        ],
      ),
      body: Center(
          child: _selectedId == 0
              ? Row(
                  children: [
                    const Text("Pilihan"),
                    DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Apple', 'Orange', 'Banana']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                    ElevatedButton(
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Pesan"),
                              content: Text("Anda memilih $dropdownValue"),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'), child: const Text("OK"))
                              ],
                            );
                          },
                        ),
                      },
                      child: const Text("Lanjut"),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                )
              : _widgetOptions.elementAt(_selectedId - 1)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedId,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
