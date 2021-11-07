import 'package:flutter/material.dart';
import 'package:team4/profile/login_page.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

import 'package:team4/profile/profile.dart';
import './model/todo_model.dart';
import './data/temp_todos.dart';
import 'calender.dart';
import 'home.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoProvider()),
        ],
        child: MyApp(),
      ),
    );

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
    StartPage(),
    LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateFromController = TextEditingController();
    TextEditingController _dateToController = TextEditingController();
    final todoProvider = Provider.of<TodoProvider>(context);

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
                  )),
              child: const Text(
                '透け',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 74, 173, 1)),
              ),
            ),
            const Text(
              'じゅ～る',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  // dialog is dismissible with a tap on the barrier
                  builder: (BuildContext context) {
                    String todo = '';
                    return AlertDialog(
                      title: Text('Enter ToDo'),
                      content: new Row(
                        children: <Widget>[
                          new Expanded(
                              child: new TextField(
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter todo',
                              icon: Icon(Icons.note_add),
                            ),
                            onChanged: (value) {
                              todo = value; //todoの内容を取得
                            },
                          )),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              // dialog is dismissible with a tap on the barrier
                              builder: (BuildContext context) {
                                String title = '';
                                DateTime dateFrom = DateTime.now();
                                DateTime dateTo = DateTime.now();

                                return AlertDialog(
                                  title: Text('Enter ToDo'),
                                  content: new Row(
                                    children: <Widget>[
                                      new Expanded(
                                          child: new TextField(
                                        controller: _dateFromController,
                                        decoration: new InputDecoration(
                                            labelText: 'いつから',
                                            hintText: 'date'),
                                        onTap: () {
                                          DatePicker.showDateTimePicker(context,
                                              showTitleActions: true,
                                              theme: DatePickerTheme(
                                                  backgroundColor: Colors.blue,
                                                  itemStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  doneStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16)),
                                              onChanged: (date) {
                                            print(
                                              'change $date in time zone ' +
                                                  date.timeZoneOffset.inHours
                                                      .toString(),
                                            );
                                          }, onConfirm: (date) {
                                            dateFrom = date;
                                            _dateFromController.text =
                                                date.toString();
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.jp);
                                        },
                                      )),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop(title);
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          // dialog is dismissible with a tap on the barrier
                                          builder: (BuildContext context) {
                                            DateTime dateTo = DateTime.now();

                                            return AlertDialog(
                                              title: Text('Enter ToDo'),
                                              content: new Row(
                                                children: <Widget>[
                                                  new Expanded(
                                                      child: new TextField(
                                                    controller:
                                                        _dateToController,
                                                    decoration:
                                                        new InputDecoration(
                                                      labelText: 'いつまで',
                                                      hintText: 'date',
                                                    ),
                                                    onChanged: (value) {
                                                      dateTo =
                                                          value as DateTime;
                                                    },
                                                    onTap: () {
                                                      DatePicker.showDateTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          theme: DatePickerTheme(
                                                              backgroundColor:
                                                                  Colors.blue,
                                                              itemStyle: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              doneStyle: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16)),
                                                          onChanged: (date) {
                                                        print('change $date in time zone ' +
                                                            date.timeZoneOffset
                                                                .inHours
                                                                .toString());
                                                      }, onConfirm: (date) {
                                                        dateTo = date;
                                                        _dateToController.text =
                                                            date.toString();
                                                      },
                                                          currentTime:
                                                              DateTime.now(),
                                                          locale:
                                                              LocaleType.jp);
                                                    },
                                                  )),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    todoProvider.addTodo(
                                                      Todo(
                                                        todoText: todo,
                                                        dateFrom: dateFrom,
                                                        dateTo: dateTo,
                                                      ),
                                                    );
                                                    Navigator.of(context)
                                                        .popUntil((route) =>
                                                            route.isFirst);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null,
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
