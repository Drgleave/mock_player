
import 'package:flutter/material.dart';
import 'package:mock_player/config/custom_router.dart';
import 'package:mock_player/enum/bottom_nav_item.dart';
import 'package:mock_player/screens/home_screen.dart';
import 'package:mock_player/screens/playlist_screen.dart';
import 'package:mock_player/screens/search_screen.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;

  const TabNavigator({super.key, required this.navigatorKey, required this.item});
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilder();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
              settings: const RouteSettings(name: tabNavigatorRoot),
              builder: (context) => routeBuilders[initialRoute]!(context))
        ];
      },
      onGenerateRoute: CustomRouter.onGenerateNestedRoute,
    );
  }

  Map<String, WidgetBuilder> _routeBuilder() {
    return {tabNavigatorRoot: (context) => _getScren(context, item)};
  }

  _getScren(BuildContext context, BottomNavItem item) {
    switch (item) {
      case BottomNavItem.one:
        return const HomeScreen();
      case BottomNavItem.two:
        return const SearchScreen();
      case BottomNavItem.three:
        return const PlaylistScreen();
      default:
        return const Scaffold();
    }
  }
}