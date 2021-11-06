import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped');
      },
      child: Container(

        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(10, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '👑ランキング',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
            text: TextSpan(
            children: [
              TextSpan(
              text: '10位',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
              ),
              TextSpan(
                text:'     ',
              ),
              TextSpan(
              text: '/1000人中',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
              ),


          ],
        ),
      ),
    ]
        )
      )
    );
  }

}