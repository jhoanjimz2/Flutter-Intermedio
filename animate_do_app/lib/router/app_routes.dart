import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = Pagina1Screen.routerName;

  static final rutasOption = <RutasOption>[
    RutasOption(route: HomeScreen.routerName, screen: const HomeScreen()),
    RutasOption(route: Pagina1Screen.routerName, screen: const Pagina1Screen()),
    RutasOption(route: TwitterScreen.routerName, screen: const TwitterScreen()),
    RutasOption(route: NavegacionScreen.routerName, screen: const NavegacionScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in rutasOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
