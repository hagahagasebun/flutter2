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

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('../assets/image/hikitatenkou2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Scaffold の背景色を透明に設定
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                comment,
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
