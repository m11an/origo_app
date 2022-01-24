import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:origi_application/model/user_data.dart';

import '../ui/bmi_screen.dart';
import '../ui/home_screen.dart';
import '../ui/q_and_a_screen.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: HomeScreen, initial: true),
  AdaptiveRoute(page: BmiScreen),
  AdaptiveRoute(page: QAndAScreen),
])
class AppRouter extends _$AppRouter {}
