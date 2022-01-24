// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    BmiScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const BmiScreen());
    },
    QAndAScreenRoute.name: (routeData) {
      final args = routeData.argsAs<QAndAScreenRouteArgs>(
          orElse: () => const QAndAScreenRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: QAndAScreen(userData: args.userData, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeScreenRoute.name, path: '/'),
        RouteConfig(BmiScreenRoute.name, path: '/bmi-screen'),
        RouteConfig(QAndAScreenRoute.name, path: '/q-and-aScreen')
      ];
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [BmiScreen]
class BmiScreenRoute extends PageRouteInfo<void> {
  const BmiScreenRoute() : super(BmiScreenRoute.name, path: '/bmi-screen');

  static const String name = 'BmiScreenRoute';
}

/// generated route for
/// [QAndAScreen]
class QAndAScreenRoute extends PageRouteInfo<QAndAScreenRouteArgs> {
  QAndAScreenRoute({UserData? userData, Key? key})
      : super(QAndAScreenRoute.name,
            path: '/q-and-aScreen',
            args: QAndAScreenRouteArgs(userData: userData, key: key));

  static const String name = 'QAndAScreenRoute';
}

class QAndAScreenRouteArgs {
  const QAndAScreenRouteArgs({this.userData, this.key});

  final UserData? userData;

  final Key? key;

  @override
  String toString() {
    return 'QAndAScreenRouteArgs{userData: $userData, key: $key}';
  }
}
