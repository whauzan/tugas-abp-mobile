import 'dart:convert';
  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  
void main() => runApp(const MyApp());
  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Todo(),
    );
  }
}
  
//Creating a class user to store the data;
class User {
  final int id;
  final int userId;
  final String title;
  final bool completed;
  
  User({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });
}
  
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}
  
class _TodoState extends State<Todo> {
//Applying get request.
  
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://jsonplaceholder.typicode.com/todos";
    final response = await http.get(Uri.parse(url));
  
    var responseData = json.decode(response.body);
  
    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
          userId: singleUser["userId"],
          title: singleUser["title"],
          completed: singleUser["completed"]);
  
      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To Do List"),
        ),
        body: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          // padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => Card(
                    shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.blue.shade700,
                    ),
                  ),
                    child: ListTile(
                      title: Column (children: [
                        Text(snapshot.data[index].title),
                        Text(snapshot.data[index].completed ? "Completed": "Not Completed"),]),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DataDetail(
                              dataModel: snapshot.data[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class DataDetail extends StatelessWidget {
  final User dataModel;
  const DataDetail({Key? key, required this.dataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List Detail"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "User Id : " + dataModel.userId.toString(),
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            "Id : " + dataModel.id.toString(),
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            dataModel.title,
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            dataModel.completed ? "Completed": "Not Completed",
            style: const TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}