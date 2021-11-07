import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('透けジュール'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    labelText: 'First Name',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Flexible(
                                child: TextField(
                                  controller: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    labelText: 'Last Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          TextField(
                            controller: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'school',
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          TextField(
                            controller: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'mail address',
                            ),
                            onChanged: (String value){
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          const SizedBox(height: 24.0),
                          TextField(
                            controller: null, // Controller実装必要
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'password',
                            ),
                            onChanged: (String value){
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          const SizedBox(height: 24.0),
                          TextField(
                            controller: null, // Controller実装必要
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'password',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () async {
                                try{
                                  //メールパスワードでユーザー登録
                                  final FirebaseAuth auth=FirebaseAuth.instance;
                                  await auth.createUserWithEmailAndPassword(email: email, password: password);
                                  // ユーザ登録に成功した場合
                                  // チャット画面に遷移＋ログイン画面を破棄
                                }catch(e){
                                  //ユーザ登録に失敗した場合
                                  setState(() {
                                    infoText = "登録に失敗しました : ${e.toString()}";
                                  });
                                }
                              },
                              child: const Text('Register'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
