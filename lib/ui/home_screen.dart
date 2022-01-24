import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:origi_application/constants.dart';
import 'package:origi_application/model/user_data.dart';
import 'package:origi_application/router/app_router.dart';
import 'package:origi_application/widget/button.dart';
import 'package:origi_application/widget/text_field_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<UserData?> getUserData() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? jsonData = sharedPreferences.getString(Constants.userData);
      if (jsonData != null && jsonData.isNotEmpty) {
        UserData userData = UserData.fromJson(jsonDecode(jsonData));
        return userData;
      }
      return null;
    }

    void openWizard() {
      AutoRouter.of(context).push(const BmiScreenRoute());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Origo app'),
      ),
      body: FutureBuilder<UserData?>(
        future: getUserData(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            UserData? user = snapshot.data;
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: user != null
                      ? Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Last answers',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              TextFieldRow(
                                  title: 'Height:',
                                  text: user.height != null
                                      ? '${user.height!}'
                                      : ''),
                              TextFieldRow(
                                  title: 'Weight:',
                                  text: user.weight != null
                                      ? '${user.weight!}'
                                      : ''),
                              TextFieldRow(
                                  title: 'BMI:',
                                  text: user.bmi != null ? '${user.bmi!}' : ''),
                              TextFieldRow(
                                  title: 'Q1:',
                                  text: user.first != null
                                      ? user.first!
                                          ? 'Yes'
                                          : 'No'
                                      : 'No answer'),
                              TextFieldRow(
                                  title: 'Q2:',
                                  text: user.second != null
                                      ? user.second!
                                          ? 'Yes'
                                          : 'No'
                                      : 'No answer'),
                              TextFieldRow(
                                  title: 'Q3:',
                                  text: user.third != null
                                      ? user.third!
                                          ? 'Yes'
                                          : 'No'
                                      : 'No answer'),
                              TextFieldRow(
                                  title: 'Q4:',
                                  text: user.fourth != null
                                      ? user.fourth!
                                          ? 'Yes'
                                          : 'No'
                                      : 'No answer'),
                              TextFieldRow(
                                  title: 'Q5:',
                                  text: user.fifth != null
                                      ? user.fifth!
                                          ? 'Yes'
                                          : 'No'
                                      : 'No answer'),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            'No data',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                ),
                ButtonWidget(
                  title: 'OPEN WIZARD',
                  onPress: openWizard,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
