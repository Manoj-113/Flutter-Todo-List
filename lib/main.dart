import 'dart:html';

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

      createTodos(){
        DocumentReference documentReference = Firestore.instance.collection("MyTodos").document(input);
      }

      Map<String,String> todos = {"todoTitle":input};

      docmentReference.setData(todos).whenComplete((){
        print("$input created")
      });


      deleteTodos(){

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
                shape: RoundedRectangleBorder(borderRadius: 
                BorderRadius.circular(8)),
                title: Text("Add Todolist"),
                content: TextField(
                  onChanged: (String value){
                    input = value;
                  },
                ),
                  actions: <Widget>[
                    FlatButton(onPressed: (){
                      createTodos();
                      Navigator.of(context).pop();
                    }, child: Text("Add"))
                  ]

              );
            });
          },child: Icon(Icons.add,
          color: Colors.white,),
          ),
          body:StreamBuilder(stream: Firestore.instance.collection("MyTodos").snapshots(),builder: (context, snapshots){
            return ListView.builder{
              itemCount:snapshots.data.documets.length,
              itemBuilder: (context,index){
                return Dismissible{
                  key:key(todos[index]),
                  child:Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                      child: ListTitle(
                        title: Text(snapshots.data["todoTitle"]),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                           onPressed:(){
                             setState(() {
                               todos.removeAt(index);
                             });
                           }),
                      ),
                    )
                  )
                }
              }
            }
          }),
          
        );
      }
    }

