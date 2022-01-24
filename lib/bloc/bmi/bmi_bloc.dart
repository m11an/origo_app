import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_data.dart';
import '../../constants.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial()) {
    on<BmiEvent>((event, emit) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (event is GetUserData) {
        UserData? userData;
        String? jsonData = sharedPreferences.getString(Constants.userData);
        if (jsonData != null && jsonData.isNotEmpty) {
          userData = UserData.fromJson(jsonDecode(jsonData));
        }
        emit(UserDataLoaded(userData));
      }
    });
  }
}
