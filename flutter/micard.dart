import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// stless : 자동으로 틀 만들어줌
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/cat.jpg'),
              ),
              Text(
                'Miyeow',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'THE CUTTEST',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.yellow.shade300,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.blue.shade100,
                ),
              ),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.redAccent,
                      ),
                      title: Text('+82 123 456 789',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro',
                          )))),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                    title: Text(
                      'miyeow@gmail.com',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  )),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.comment,
                      color: Colors.redAccent,
                    ),
                    title: Text(
                      'Hello World! Hello Flutter!',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
