import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = ZapatoScreen.routerName;

  static final rutasOption = <RutasOption>[
    RutasOption(route: ZapatoScreen.routerName, screen: const ZapatoScreen()),
    RutasOption(route: ZapatoDescScreen.routerName, screen: const ZapatoDescScreen()),
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
