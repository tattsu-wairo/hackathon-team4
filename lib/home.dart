import 'package:flutter/material.dart';

import './dailyLearning/daily_learning.dart';
import 'rankingPage/ranking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: ランキングページへの遷移をランキングタブの箇所で実装（ここじゃない）
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RankingPage(),
          ),
        );
      },
      child: DailyLearning(),
      );
  }
}
