import 'package:flutter/material.dart';
import 'package:team4/profile/login_model.dart';
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
    return const MaterialApp(
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
    Login(),
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
        title: const Text('透けジュール'),
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
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
