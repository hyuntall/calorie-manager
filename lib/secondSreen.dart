import 'package:flutter/material.dart';
import 'package:kcal_manager/firstScreen.dart';

class SecondScreen extends StatelessWidget {
  final MyArguments params;
  SecondScreen({required this.params});
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
                          gage('일일 칼로리 : ' + params.myCaloires.toString()),
                          gage('탄수화물'),
                          gage('단백질'),
                          gage('지방'),
                          Row(
                            children: [
                              ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text('뒤로가기'))
                            ],
                          )
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
