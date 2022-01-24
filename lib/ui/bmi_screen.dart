import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origi_application/bloc/bmi/bmi_bloc.dart';
import 'package:origi_application/constants.dart';
import 'package:origi_application/model/user_data.dart';
import 'package:origi_application/router/app_router.dart';
import 'package:origi_application/widget/button.dart';
import 'package:origi_application/widget/input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? userData;
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController bmiController = TextEditingController();

    weightController.addListener(() {
      String weight = weightController.text;
      String height = heightController.text;
      if (weight.isNotEmpty && height.isNotEmpty) {
        double weightNum = Utility.checkNumber(weight);
        double heightNum = Utility.checkNumber(height);
        if (weightNum > 0 && heightNum > 0) {
          double bmi = Utility.getBMI(heightNum, weightNum);
          bmiController.value = TextEditingValue(text: bmi.toStringAsFixed(2));
        }
      } else {
        bmiController.value = const TextEditingValue(text: '');
      }
    });

    heightController.addListener(() {
      String weight = weightController.text;
      String height = heightController.text;
      if (weight.isNotEmpty && height.isNotEmpty) {
        double weightNum = Utility.checkNumber(weight);
        double heightNum = Utility.checkNumber(height);
        if (weightNum > 0 && heightNum > 0) {
          double bmi = Utility.getBMI(heightNum, weightNum);
          bmiController.value = TextEditingValue(text: '$bmi');
        }
      } else {
        bmiController.value = const TextEditingValue(text: '');
      }
    });

    void saveToPrefrences() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          Constants.userData, jsonEncode(userData!.toJson()));
    }

    void saveUserData() {
      String weight = weightController.text;
      String height = heightController.text;
      double weightNum = Utility.checkNumber(weight);
      double heightNum = Utility.checkNumber(height);
      if (weightNum > 0 && heightNum > 0) {
        String bmi = bmiController.text;
        double bmiNum = Utility.checkNumber(bmi);
        if (userData != null) {
          if (weightNum != userData!.weight) {
            userData!.weight = weightNum;
          }
          if (heightNum != userData!.height) {
            userData!.height = heightNum;
          }

          if (bmiNum != userData!.bmi) {
            userData!.bmi = bmiNum;
          }
        } else {
          userData =
              UserData(bmi: bmiNum, weight: weightNum, height: heightNum);
        }
        saveToPrefrences();
      }
    }

    void openQAndA() {
      saveUserData();
      AutoRouter.of(context).push(QAndAScreenRoute(userData: userData));
    }

    void saveAndQuit() {
      saveUserData();
      AutoRouter.of(context).pushAndPopUntil(
        const HomeScreenRoute(),
        predicate: (route) => false,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
      ),
      body: BlocProvider<BmiBloc>(
        create: (context) => BmiBloc(),
        child: BlocBuilder<BmiBloc, BmiState>(builder: (blocCtx, state) {
          if (state is BmiInitial) {
            BlocProvider.of<BmiBloc>(blocCtx).add(GetUserData());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDataLoaded) {
            if (state.userData != null) {
              if (state.userData!.height != null &&
                  state.userData!.height! > 0) {
                heightController.text = '${state.userData!.height!}';
              }
              if (state.userData!.weight != null &&
                  state.userData!.weight! > 0) {
                weightController.text = '${state.userData!.weight!}';
              }
              if (state.userData!.bmi != null && state.userData!.bmi! > 0) {
                bmiController.text = '${state.userData!.bmi!}';
              }
            }
            userData = state.userData;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'BMI',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InputField(
                          textEditingController: heightController,
                          enabledInput: true,
                          labelText: 'Height in m',
                          inputType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                        InputField(
                          textEditingController: weightController,
                          enabledInput: true,
                          labelText: 'Weight in kg',
                          inputType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                        InputField(
                          textEditingController: bmiController,
                          enabledInput: false,
                          labelText: 'BMI',
                          inputType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonWidget(
                  title: 'CONTINUE',
                  onPress: openQAndA,
                ),
                ButtonWidget(
                  title: 'SAVE AND QUIT',
                  onPress: saveAndQuit,
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
