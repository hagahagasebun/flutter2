import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.result, this.quizNumber, {Key? key}) : super(key: key);
  int result;
  int quizNumber;
  late String comment;

  Future<void> goToTop(BuildContext context) async {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    switch (result.round() * 100 ~/ quizNumber) {
      case 60:
        comment = "あほんだらだな！！！";
        break;
      case 70:
        comment = "まあまあやるじゃん";
        break;
      case 80:
        comment = "やるじゃん";
        break;
      case 90:
        comment = "すごいじゃー－－ん";
        break;
      case 100:
        comment = "よくできたね♡";
        break;
      default:
        comment = "俺のこと勉強しろよ";
        break;
    }
    print("${result / quizNumber * 100}");

    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[
            Text(comment,
                style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            Text('正答数$result'),
            Text('正答率${result / quizNumber * 100}%'),
            ElevatedButton(
                onPressed: () async {
                  await goToTop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 10.0,
                  shadowColor: Colors.red,
                ),
                child: Text(
                  'トップへ戻る',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}
