import 'package:flutter/material.dart';


class RankingTopUser extends StatelessWidget {
  const RankingTopUser({
    this.userName = '',
    this.iconSize = 60,
    this.nameColor = Colors.white,
    this.imageAddress = '',
  });

  final double iconSize;
  final String userName;
  final Color nameColor;
  final String imageAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imageAddress),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            userName,
            style: TextStyle(
              color: nameColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
