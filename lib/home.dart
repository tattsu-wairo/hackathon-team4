import 'package:flutter/material.dart';

import './dailyLearning/daily_learning.dart';
import 'ranking_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      DailyLearning(),
      Ranking(),
    ],
    );
  }
}
