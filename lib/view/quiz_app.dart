import 'package:flutter/material.dart';
import 'package:quiz/service/load_csv.dart';
import 'package:quiz/service/suffle.dart';
import 'package:quiz/view/quiz_page.dart';

class QuizApp extends StatelessWidget {
  QuizApp({Key? key}) : super(key: key);
  late List<Map> quizList;

  Future<void> goToQuizApp(BuildContext context) async {
    quizList = shuffle(await getCsvData('assets/quiz1.csv'));
    for (Map row in quizList) {
      debugPrint(row["question"]);
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizPage(quizList)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/image/hikitatenkou.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
            mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
            children: <Widget>[
              const Text(
                '21年間生き抜いた自分',
                style: TextStyle(
                  color: Colors.red, //文字の色
                  fontSize: 100, //文字の大きさ
                  fontWeight: FontWeight.bold, //テキストの太さ
                ),
              ),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      goToQuizApp(context); //クイズアプリへ遷移するQuizApp関数がよばれる
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // 背景色
                      onPrimary: Colors.red, //ボタンのテキスト文字色
                      elevation: 10.0,
                      shadowColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // 角丸の半径
                      ),
                    ),
                    child: Text(
                      'スタート',
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
