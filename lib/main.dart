import 'package:chuck_norris/repositories/chuck_norris_consults.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ObjectListScreen(),
    );
  }
}

class ObjectListScreen extends StatefulWidget {
  @override
  ObjectListScreen({super.key});

  @override
  State<ObjectListScreen> createState() => _ObjectListScreenState();
}

class _ObjectListScreenState extends State<ObjectListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Chuck Norris'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: consultData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                    hoverColor: Colors.amber,
                    contentPadding: EdgeInsets.all(20),
                    title: Text(
                      '${snapshot.data?[index]["id"]}',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    subtitle: Text('${snapshot.data?[index]["value"]}',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    trailing: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "img/duck.gif",
                      ),
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(
                child: SizedBox(
              width: 100,
              height: 100,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    "img/duck.gif",
                  ),
                ),
              ),
            ));
          }
        },
      ),
    );
  }
}
