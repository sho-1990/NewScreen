import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: 'Screens',
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),

      body: ListView(
        children: <Widget>[
          ListTile(
            title: TextField(
              controller: _nameFieldController,
              decoration: InputDecoration(
                labelText: "Enter Your Name"
              ),
            ),
          ),
          ListTile(
            title: RaisedButton(
                child: Text("Send To Next Screen"),
                onPressed: () {
                  var router = MaterialPageRoute(
                    builder: (BuildContext context) => NextScreen(name: _nameFieldController.text)
                  );
                  Navigator.of(context).push(router);
                }),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {

  final String name;

  const NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: ListTile(
        title: Text('${widget.name}'),
      ),
    );
  }
}
