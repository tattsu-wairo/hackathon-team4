import 'package:flutter/material.dart';

import 'ranking_top_user.dart';
import '../data/temp_user.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ランキング'),
        shadowColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 74, 173, 1),
                  Color.fromRGBO(0, 74, 173, 1),
                  Color.fromRGBO(0, 74, 173, 0.8)
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 74, 173, 0.5),
                  offset: Offset(0, 2),
                  blurRadius: 14,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankingTopUser(
                  userName: users[1]['name'].toString(),
                  nameColor: Color.fromRGBO(220, 220, 220, 1),
                  iconSize: 60,
                  imageAddress: users[1]['imageUrl'].toString(),
                ),
                RankingTopUser(
                  userName: users[0]['name'].toString(),
                  nameColor: Color.fromRGBO(219, 187, 37, 1),
                  iconSize: 75,
                  imageAddress: users[0]['imageUrl'].toString(),
                ),
                RankingTopUser(
                  userName: users[2]['name'].toString(),
                  nameColor: Color.fromRGBO(217, 163, 98, 1),
                  iconSize: 60,
                  imageAddress: users[2]['imageUrl'].toString(),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: .5,
                        color: Color.fromRGBO(0, 74, 173, 0.2),
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 74, 173, 1),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(0, 74, 173, 0.2),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    users[index]['imageUrl'].toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            users[index]['name'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(60, 60, 60, 1),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          users[index]['score'].toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(60, 60, 60, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
