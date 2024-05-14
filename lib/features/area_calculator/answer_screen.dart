import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  final Answer;
  AnswerScreen({super.key, required this.Answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset("assets/sapling.png",
              height: MediaQuery.of(context).size.height * 0.2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "Approxiate required sapling count",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            '${Answer.toString()}',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          (Answer - 25 < 0)
              ? Text(
                  'Suggested: ${0} to ${Answer + 25}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                )
              : Text(
                  'Suggested: ${Answer - 25} to ${Answer + 25}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "*This are just approximate count, the actual requirement may vary due lot of other factors. Please take it into considerations !",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
