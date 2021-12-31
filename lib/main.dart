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
          appBar: AppBar( actions: [Icon(Icons.star), Icon(Icons.star)],leading: Icon(Icons.star), title: Text("calorie_manager")),
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
                              Container(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'height'
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'weight'
                                  ),
                                ),
                              ),
                              ElevatedButton(onPressed: () {}, child: Text('계산')),
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
                    color: Colors.white
                  ),flex: 3,
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        gage('탄수화물'),
                        gage('단백질'),
                        gage('지방'),
                        gage('총 칼로리'),
                      ],
                    ),
                    color: Colors.white
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

  final String name;
  const gage(this.name, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black
        )
      ),
      child: Row(
        children: [
          Flexible(child: Container(
            margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
            height: 50,
              child: ElevatedButton(
                onPressed: (){},
                child: Icon(Icons.add_box),
              )
          ),flex: 1,
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    "일일 "+name + " : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.4622,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flex: 9,
          ),
        ],
      ),
    );
  }
}
