import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; //firebase cloud storage
import 'Drawer.dart';
/*
* Massive credit goes to the website medium not sure if their stuff is open source but
* almost all this code is from tutorials and informational pages they developed
* */
class Suggestions extends StatefulWidget{
  SuggestionsState createState() => SuggestionsState();
}
class CustomCard extends StatelessWidget {
  CustomCard({@required this.title, this.description});

  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Card(
            color: Color.fromRGBO(255,204,78,77.8),
            child: Padding(
                padding: const EdgeInsets.only(
                    top:8.0,
                    bottom:10.0,
                    left:64.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Text("Name: "+title,
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                    new Text("Suggestion: "+description,
                        style: TextStyle(
                            color: Colors.white
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}
class SuggestionsState extends State<Suggestions> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;

  @override
  initState() {
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    super.initState();
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
            children: <Widget>[
            Text("Please fill all fields to create a suggestion"),
        Expanded(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: 'Name*'),
            controller: taskTitleInputController,
          ),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: 'Suggestion*'),
              controller: taskDescripInputController,
            ),
          )
          ],
        ),
        actions: <Widget>[
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                taskTitleInputController.clear();
                taskDescripInputController.clear();
                Navigator.pop(context);
              }),
          FlatButton(
              child: Text('Add'),
              onPressed: () {
                if (taskDescripInputController.text.isNotEmpty &&
                    taskTitleInputController.text.isNotEmpty) {
                  Firestore.instance
                      .collection('Suggestions')
                      .add({
                    "Name": taskTitleInputController.text,
                    "Suggestion": taskDescripInputController.text
                  })
                      .then((result) => {
                      Navigator.pop(context),
                taskTitleInputController.clear(),
                taskDescripInputController.clear(),
                })
                    .catchError((err) => print(err));
              }
              })
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: new AppBar(
          backgroundColor: Color.fromRGBO(255, 204, 76, 77.8),
          title: Text("Suggestions"),
          leading: Builder(
              builder: (ctx) => IconButton(
                icon: new Image.asset('assets/images/Drawer_Image.png'),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
              )
          )
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Suggestions')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return new ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                            return new CustomCard(
                                title: document['Name'],
                                description: document['Suggestion']
                            );
                      }).toList(),
                    );
                }
              },
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}