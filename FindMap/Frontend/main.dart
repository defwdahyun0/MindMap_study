import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(SearchMain());

class SearchMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.yellow[700],
                toolbarHeight: 50,
                flexibleSpace: SafeArea(
                  child: TabBar(tabs: [
                    Tab(
                      text: '검색',
                    ),
                    Tab(text: '실시간검색어'),
                  ]),
                ),
              ),
              body: TabBarView(
                children: [
                  Icon(Icons.search),
                  RealtimeSearch(),
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.archive_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.article_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.account_circle),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )));
  }
}

class RealtimeSearch extends StatefulWidget {
  @override
  _RealtimeSearchState createState() => _RealtimeSearchState();
}

class _RealtimeSearchState extends State<RealtimeSearch> {
  int pressed = 1;
  /*@override
  void initState() {
    super.initState();
    mainList.addAll(sampleMenList);
  }*/
  String textHolder = 'Old Sample Text';

  showList() {
    setState(() {
      textHolder = "New Sample Text...";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  child: Text("종합"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    textStyle: TextStyle(
                      fontWeight:
                          pressed == 1 ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.5,
                      decoration: pressed == 1
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  onPressed: () {
                    showList();
                    setState(() {
                      pressed = 1;
                    });
                  },
                ),
                TextButton(
                  child: Text("뉴스"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    textStyle: TextStyle(
                      fontWeight:
                          pressed == 2 ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.5,
                      decoration: pressed == 2
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      pressed = 2;
                    });
                  },
                ),
                TextButton(
                  child: Text("음악"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    textStyle: TextStyle(
                      fontWeight:
                          pressed == 3 ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.5,
                      decoration: pressed == 3
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      pressed = 3;
                    });
                  },
                ),
                TextButton(
                  child: Text("영화"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    textStyle: TextStyle(
                      fontWeight:
                          pressed == 4 ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.5,
                      decoration: pressed == 4
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      pressed = 4;
                    });
                  },
                ),
                TextButton(
                  child: Text("스포츠"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    textStyle: TextStyle(
                      fontWeight:
                          pressed == 5 ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.5,
                      decoration: pressed == 5
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      pressed = 5;
                    });
                  },
                ),
                TextButton(
                  child: Text("책"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    textStyle: TextStyle(
                      fontWeight:
                          pressed == 6 ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.5,
                      decoration: pressed == 6
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      pressed = 6;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: GetRealtimeSearch(categoryID: pressed),
            padding: EdgeInsets.only(top: 40),
          ),
        ],
      ),
    );
  }
}

class GetRealtimeSearch extends StatefulWidget {
  final int categoryID;

  GetRealtimeSearch({Key key, this.categoryID}) : super(key: key);

  @override
  _GetRealtimeSearchState createState() => _GetRealtimeSearchState();
}

class _GetRealtimeSearchState extends State<GetRealtimeSearch> {
  final List<String> keyword1 = <String>[
    'C',
    'C++',
    'JAVA',
    'Javascript',
    'python',
    'ruby',
    'typescript',
    'scala',
    'Kotlin',
    'Dart',
  ];
  final List<String> keyword2 = <String>[
    'Pytorch',
    'Tensorflow',
    'Keras',
    'OpenCV',
    'Flask',
    'Django',
    'Scikit-learn',
    'Django',
    'Numpy',
    'Pandas',
  ];
  final List<String> keyword3 = <String>[
    'Butter',
    'Damselfly',
    'Clair de Lune',
    'Dang!',
    'Believer',
    'Drive',
    'Butterflies',
    'Rain On Me',
    'Your Power',
    'bad guy',
  ];
  final List<String> keyword4 = <String>[
    'IronMan',
    'Parasite',
    'The Dig',
    'To All The Boys',
    'The Father',
    'Tom & Jerry',
    'Frozen',
    'Justice League',
    'Avengers',
    'furious 9',
  ];
  final List<String> keyword5 = <String>[
    'baseball',
    'basketball',
    'soccer',
    'running',
    'boxing',
    'valley ball',
    'golf',
    'judo',
    'taekwondo',
    'swimming',
  ];
  final List<String> keyword6 = <String>[
    'Harry Potter',
    '1987',
    'The little prince',
    'Yearbook',
    'Atomic Habits',
    'Behold a Pale Horse',
    'Rich Dad Poor Dad',
    'Zero Fail',
    'People We Meet on Vacation',
    'The Alchemist',
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.categoryID == 1) {
      // 종합
      return ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: keyword1.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              0.0,
              0.0,
              0.0,
            ),
            color: index % 2 == 0 ? Colors.yellow[100] : Colors.grey[200],
            height: 40,
            child: Row(
              children: [
                Text(
                  (index + 1).toString() + '      ' + '${keyword1[index]}',
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.3,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          color: Colors.black54,
        ),
      );
    } else if (widget.categoryID == 2) {
      // 뉴스
      return ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: keyword2.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              0.0,
              0.0,
              0.0,
            ),
            color: index % 2 == 0 ? Colors.yellow[100] : Colors.grey[200],
            height: 40,
            child: Row(
              children: [
                Text(
                  (index + 1).toString() + '      ' + '${keyword2[index]}',
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.3,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          color: Colors.black54,
        ),
      );
    } else if (widget.categoryID == 3) {
      // 음악
      return ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: keyword3.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              0.0,
              0.0,
              0.0,
            ),
            color: index % 2 == 0 ? Colors.yellow[100] : Colors.grey[200],
            height: 40,
            child: Row(
              children: [
                Text(
                  (index + 1).toString() + '      ' + '${keyword3[index]}',
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.3,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          color: Colors.black54,
        ),
      );
    } else if (widget.categoryID == 4) {
      // 영화
      return ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: keyword4.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              0.0,
              0.0,
              0.0,
            ),
            color: index % 2 == 0 ? Colors.yellow[100] : Colors.grey[200],
            height: 40,
            child: Row(
              children: [
                Text(
                  (index + 1).toString() + '      ' + '${keyword4[index]}',
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.3,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          color: Colors.black54,
        ),
      );
    } else if (widget.categoryID == 5) {
      // 스포츠
      return ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: keyword4.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              0.0,
              0.0,
              0.0,
            ),
            color: index % 2 == 0 ? Colors.yellow[100] : Colors.grey[200],
            height: 40,
            child: Row(
              children: [
                Text(
                  (index + 1).toString() + '      ' + '${keyword5[index]}',
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.3,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          color: Colors.black54,
        ),
      );
    } else if (widget.categoryID == 6) {
      // 영화
      return ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: keyword4.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              0.0,
              0.0,
              0.0,
            ),
            color: index % 2 == 0 ? Colors.yellow[100] : Colors.grey[200],
            height: 40,
            child: Row(
              children: [
                Text(
                  (index + 1).toString() + '      ' + '${keyword6[index]}',
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.3,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          color: Colors.black54,
        ),
      );
    }
  }
}
