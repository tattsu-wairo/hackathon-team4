import 'package:flutter/material.dart';
import 'package:team4/profile/login_page.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:team4/profile/profile.dart';
import 'calender.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 74, 173, 1),
      ),
      title: '透けジュール',
      home: BaseWidget(),
    );
  }
}

class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    //TODO: ここのウィジェットを各ページのWidgetにする
    HomePage(),
    CalenderExample(),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 2),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(0.85),
                  ],
                )
              ),
              child: const Text(
                '透け',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 74, 173, 1)),
              ),
            ),
            const Text(
              'ジュール',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: _selectedIndex == 1 ? FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false, // dialog is dismissible with a tap on the barrier
            builder: (BuildContext context) {
              String title = '';

              DateTime limitDay = DateTime.now();
              return AlertDialog(
                title: Text('Enter ToDo'),
                content: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                          autofocus: true,
                          decoration: new InputDecoration(
                              labelText: 'limitDay', hintText: 'date'
                          ),
                          onTap: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                theme: DatePickerTheme(
                                    backgroundColor: Colors.blue,
                                    itemStyle: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                    doneStyle:
                                    TextStyle(color: Colors.white, fontSize: 16)),
                                onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                }, currentTime: DateTime.now(), locale: LocaleType.jp);
                          },
                        )
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop(title);
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 74, 173, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
