import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var titleSection = Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    var buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBUttonColumn(color, Icons.call, 'CALL'),
          _buildBUttonColumn(color, Icons.near_me, 'ROUTE'),
          _buildBUttonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    var textSection = Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Install the Dart plugin (see Editor setup) to get automatic formatting of code in Android Studio and IntelliJ. To automatically format your code in the current source code window, use Cmd+Alt+L (on Mac) or Ctrl+Alt+L (on Windows and Linux). Android Studio and IntelliJ also provides a check box named Format code on save on the Flutter page in Preferences (on Mac) or Settings (on Windows and Linux) which will format the current file automatically when you save it.',
        softWrap: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: mounted,
        title: Text('Flutter layout demo'),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://inteng-storage.s3.amazonaws.com/img/iea/MRw4y5ABO1/sizes/camping-tech-trends_resize_md.jpg',
            height: 240,
            width: 600,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  Column _buildBUttonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
