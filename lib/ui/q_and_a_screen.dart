import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:origi_application/constants.dart';
import 'package:origi_application/model/user_data.dart';
import 'package:origi_application/router/app_router.dart';
import 'package:origi_application/widget/button.dart';
import 'package:origi_application/widget/q_and_a_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QAndAScreen extends StatelessWidget {
  final UserData? userData;
  const QAndAScreen({this.userData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void changeQ(int index, bool a) {
      switch (index) {
        case 0:
          userData!.first = a;
          break;
        case 1:
          userData!.second = a;
          break;
        case 2:
          userData!.third = a;
          break;
        case 3:
          userData!.fourth = a;
          break;
        case 4:
          userData!.fifth = a;
          break;
        default:
          break;
      }
    }

    bool? getValue(int index) {
      if (userData != null) {
        switch (index) {
          case 0:
            return userData!.first;
          case 1:
            return userData!.second;
          case 2:
            return userData!.third;
          case 3:
            return userData!.fourth;
          case 4:
            return userData!.fifth;
          default:
            return null;
        }
      } else {
        return null;
      }
    }

    void saveAndQuit() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          Constants.userData, jsonEncode(userData!.toJson()));
      AutoRouter.of(context).pushAndPopUntil(
        const HomeScreenRoute(),
        predicate: (route) => false,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Q and A'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: Constants.questionList.map((e) {
                  int index = Constants.questionList.indexOf(e);
                  bool? value = getValue(index);
                  return QAndAWidget(
                    question: e,
                    index: index,
                    changeAnswer: changeQ,
                    value: value,
                  );
                }).toList(),
              ),
            ),
          ),
          ButtonWidget(
            title: 'SAVE AND QUIT',
            onPress: saveAndQuit,
          ),
        ],
      ),
    );
  }
}
