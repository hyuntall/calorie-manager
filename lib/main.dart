import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar( actions: [Icon(Icons.star), Icon(Icons.star)],leading: Icon(Icons.star), title: Text("앱바")),
          body: Container(
            color: Colors.blue,
            child: Column(

              children: [
                Flexible(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(onPressed: () {}, child: Text('키')),
                              ElevatedButton(onPressed: () {}, child: Text('몸무게')),
                              ElevatedButton(onPressed: () {}, child: Text('칼로리')),
                            ],
                          ), flex: 1,
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(onPressed: () {}, child: Text('1')),
                              ElevatedButton(onPressed: () {}, child: Text('2')),
                              ElevatedButton(onPressed: () {}, child: Text('3')),
                              ElevatedButton(onPressed: () {}, child: Text('4')),
                              ElevatedButton(onPressed: () {}, child: Text('5')),
                            ],
                          ), flex: 1,
                        ),
                      ],
                    ),
                    color: Colors.green
                  ),flex: 3,
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        gage(),
                        gage(),
                        gage(),
                        gage(),
                      ],
                    ),
                    color: Colors.red
                  ),flex: 7,
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.phone),
                  Icon(Icons.message),
                  Icon(Icons.contact_page),
                ],
              ),
            ),
          ),
        )
    );
  }
}

class gage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '탄수화물',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 300,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: 0.4622,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
