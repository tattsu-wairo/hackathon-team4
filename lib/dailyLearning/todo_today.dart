import 'package:flutter/material.dart';

class TodoToday extends StatefulWidget {
  const TodoToday({Key? key}) : super(key: key);

  @override
  _TodoTodayState createState() => _TodoTodayState();
}

class _TodoTodayState extends State<TodoToday> {
  Map<String, bool> values = {
    '英語ワークp48-50': true,
    '社会まとめプリント': false,
    '数学ワークp48-50': true,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: ListView(
        shrinkWrap: true,
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: Text(
              key,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            value: values[key],
            activeColor: Color.fromRGBO(0, 74, 173, 1),
            onChanged: (value) {
              setState(() {
                values[key] = value.toString() == 'true';
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
