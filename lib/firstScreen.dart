import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'secondSreen.dart';

class First extends StatefulWidget{
  @override
  FirstScreen createState() => FirstScreen();

}

class FirstScreen extends State<First> {
  int height = 0;
  int weight = 0;
  int age = 0;
  double func = 0.0;
  int calories = 0;
  late SharedPreferences _prefs;

  void initState(){
    super.initState();
    _loadData();
  }

  _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      calories = (_prefs.getInt('toCal') ?? 0);
    });
  }
  void computeCal(double func){
    calories = ((66 + (13.7 * weight) + (5*height) - (6.8 * age)) * func).round();
    _prefs.setInt('toCal', calories);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar( actions: [Icon(Icons.star), Icon(Icons.star)],leading: Icon(Icons.star), title: Text("calorie_manager")),
          body: Container(
              color: Colors.blue,
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
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                                onChanged: (text){
                                  setState(() {
                                    height = int.parse(text);
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'height'
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: TextField(
                                onChanged: (text){
                                  setState(() {
                                    weight = int.parse(text);
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'weight'
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: TextField(
                                onChanged: (text){
                                  setState(() {
                                    age = int.parse(text);
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'age'
                                ),
                              ),
                            ),
                          ],
                        ), flex: 1,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: () {
                              setState(() {
                                computeCal(1.2);
                              });
                            }, child: Text('거의 없다')),
                            ElevatedButton(onPressed: () {
                              setState(() {
                                computeCal(1.375);
                              });
                            }, child: Text('조금 있다')),
                            ElevatedButton(onPressed: () {
                              setState(() {
                                computeCal(1.55);
                              });
                            }, child: Text('보통')),
                            ElevatedButton(onPressed: () {
                              setState(() {
                                computeCal(1.725);
                              });
                            }, child: Text('꽤 있다')),
                            ElevatedButton(onPressed: () {
                              setState(() {
                                computeCal(1.9);
                              });
                            }, child: Text('아주 많다')),
                          ],
                        ), flex: 1,
                      ),
                      Flexible(child: Text('$calories')),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: () async {
                              final params = MyArguments(calories);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Second(params:params)),
                              );
                            }, child: Text('계산하기')),
                          ],
                        ), flex: 1,
                      )
                    ],
                  ),
                  color: Colors.white
              )
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

class MyArguments{
  final int myCaloires;

  MyArguments(this.myCaloires);
}