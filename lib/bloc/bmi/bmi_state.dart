part of 'bmi_bloc.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}

class UserDataLoaded extends BmiState {
  final UserData? userData;

  UserDataLoaded(this.userData);
}
