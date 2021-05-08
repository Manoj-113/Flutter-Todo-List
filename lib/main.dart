import 'package:flutter/material.dart';

void main() => 
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData (
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.orange),
    home: MyApp(),
    ));

    class MyApp extends StatefulWidget {
      @override
      _MyAppState createState() => _MyAppState();
    }
    
    class _MyAppState extends State<MyApp> {
      List todos = List();
      String input = "";


      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
  }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("mytodos"),
          ),
          floatingActionButton: FloatingActionButton(onPressed: 
          (){
            showDialog(context: context, 
            builder:
            (BuildContext context){
              return AlertDialog(
                title: Text("Add Todolist"),
                content: TextField(
                  onChanged: (String value){
                    input = value;
                  },
                ),
                  actions: <Widget>[
                    FlatButton(onPressed: (){
                      setState(() {
                        todos.add(input);
                      });
                    }, child: Text("Add"))
                  ]
                
              );
            });
          },child: Icon(Icons.add,
          color: Colors.white,),
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

