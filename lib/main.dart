import 'package:flutter/material.dart';

void main() => 
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData (
    brightness: Brightness.light,
    primaryColor: blue,
    accentColor: Color.orange),
    home: MyApp(),
    ));

    class MyApp extends StatefulWidget {
      @override
      _MyAppState createState() => _MyAppState();
    }
    
    class _MyAppState extends State<MyApp> {


      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
  }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("mytodos"),
          ),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index){
              return Dismissible(
                key: Key(todos[index]), 
                child: Card(
                  child: ListTile(
                    title: Text(todos[index]),
                ),
              ));
            }),
          
        );
      }
    }

