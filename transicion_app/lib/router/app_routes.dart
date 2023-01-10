import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = Pagina1Screen.routerName;

  static final rutasOption = <RutasOption>[
    RutasOption(route: Pagina1Screen.routerName, screen: const Pagina1Screen()),
    RutasOption(route: Pagina2Screen.routerName, screen: const Pagina2Screen()),
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
