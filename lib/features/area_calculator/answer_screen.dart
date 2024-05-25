import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            "approx_sapling_count".tr,
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
                  'suggested'.tr+': ${0} '+ "to".tr +'${Answer + 25}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                )
              : Text(
                  "suggested".tr + ': ${Answer - 25}' +  "to".tr + ' ${Answer + 25}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "warning_cnt".tr,
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
