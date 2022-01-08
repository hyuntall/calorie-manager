import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kcal_manager/firstScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
int totalCal = 0;
int calories = 0;
int carb = 0;
int prot = 0;
int fat = 0;
int addData = 0;
class Second extends StatefulWidget{
  final MyArguments params;
  Second({required this.params});
  @override
  SecondScreen createState() => SecondScreen(params: params);

}

class SecondScreen extends State<Second> {
  final MyArguments params;
  SecondScreen({required this.params});
  late SharedPreferences _prefs;
  void initState(){
    super.initState();
    _loadData();
  }

  _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      totalCal = (_prefs.getInt('toCal') ?? params.myCaloires);
      calories = (_prefs.getInt('cal') ?? 0);
      carb = (_prefs.getInt('carb') ?? 0);
      prot = (_prefs.getInt('prot') ?? 0);
      fat = (_prefs.getInt('fat') ?? 0);
    });
  }

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
                          Column(
                            children: [
                              Text('일일 전체 칼로리 : $calories / $totalCal'),
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  minHeight: 30,
                                  value: calories/totalCal,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('일일 탄수화물 칼로리 : $carb / ' + (totalCal/2).toString()),
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  minHeight: 30,
                                  value: carb/(totalCal/2),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('일일 단백질 칼로리 : $prot / '+(totalCal*3/10).toString()),
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  minHeight: 30,
                                  value: prot/(totalCal*3/10),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('일일 지방 칼로리 : $fat / '+(totalCal*2/10).toString()),
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  minHeight: 30,
                                  value: fat/(totalCal*2/10),
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(onPressed: () {
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text('섭취 칼로리'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          TextField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                                            onChanged: (text){
                                              setState(() {
                                                addData = int.parse(text);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(onPressed: () {
                                        _prefs.setInt('cal', calories+addData);
                                        _loadData();
                                        Navigator.of(context).pop();
                                        addData = 0;
                                      }, child: Text("추가")),
                                      ElevatedButton(onPressed: () {
                                        Navigator.of(context).pop();
                                        addData = 0;
                                      }, child: Text("닫기")),
                                    ]
                                  );
                                });
                              }, child: Text('추가하기')),
                              ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text('뒤로가기')),
                              ElevatedButton(onPressed: () {
                                setState(() {
                                  _prefs.setInt('cal', 0);
                                  _prefs.setInt('carb', 0);
                                  _prefs.setInt('prot', 0);
                                  _prefs.setInt('fat', 0);
                                  _loadData();
                                });
                              }, child: Text('초기화')),

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