// ログイン画面用Widget
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team4/profile/profile.dart';

import '../calender.dart';
import '../home.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // メールアドレス入力
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () async {
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return Profile();
                      }),
                    );
                  },
                  // onPressed: () async {
                  //   try {
                  //     // メール/パスワードでユーザー登録
                  //     final FirebaseAuth auth = FirebaseAuth.instance;
                  //     await auth.createUserWithEmailAndPassword(
                  //       email: email,
                  //       password: password,
                  //     );
                  //     // ユーザー登録に成功した場合
                  //     // チャット画面に遷移＋ログイン画面を破棄
                  //     await Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(builder: (context) {
                  //         return Profile();
                  //       }),
                  //     );
                  //   } catch (e) {
                  //     // ユーザー登録に失敗した場合
                  //     setState(() {
                  //       infoText = "登録に失敗しました：${e.toString()}";
                  //     });
                  //   }
                  // },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}