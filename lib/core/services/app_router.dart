import 'package:flutter/material.dart';

import '../../views/recyclebin.dart';
import '../../views/tabsView.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (context) {
          return const RecycleBin();
        });
      case TabsScreen.id:
        return MaterialPageRoute(builder: (context) {
          return TabsScreen();
        });
      default:
        return null;
    }
  }
}
