import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/models.dart';
import '../screens/screens.dart';
import '../retos/retos.dart';

class AppRoutes {
  static const initialRoute = LauncherScreen.routerName;

  static final rutasOption = <RutasOption>[
    RutasOption(route: HeadersScreen.routerName, screen: const HeadersScreen()),
    RutasOption(route: AnimacionesScreen.routerName, screen: const AnimacionesScreen()),
    RutasOption(route: CuadradoAnimadoScreen.routerName, screen: const CuadradoAnimadoScreen()),
    RutasOption(route: GraficasCircularesScreen.routerName, screen: const GraficasCircularesScreen()),
    RutasOption(route: SlideshowScreen.routerName, screen: const SlideshowScreen()),
    RutasOption(route: PinterestScreen.routerName, screen: const PinterestScreen()),
    RutasOption(route: EmergencyScreen.routerName, screen: const EmergencyScreen()),
    RutasOption(route: SliderListScreen.routerName, screen: const SliderListScreen()),
    RutasOption(route: LauncherScreen.routerName, screen: const LauncherScreen()),
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


  static final menuOptions = <MenuOption>[
    MenuOption(
      route: SlideshowScreen.routerName,
      name: 'Slideshow',
      screen: const SlideshowScreen(),
      icon: FontAwesomeIcons.slideshare
    ),
    MenuOption(
      route: EmergencyScreen.routerName,
      name: 'Emergencia',
      screen: const EmergencyScreen(),
      icon: FontAwesomeIcons.truckMedical
    ),
    MenuOption(
      route: HeadersScreen.routerName,
      name: 'Encabezados',
      screen: const HeadersScreen(),
      icon: FontAwesomeIcons.heading
    ),
    MenuOption(
      route: CuadradoAnimadoScreen.routerName,
      name: 'Cuadro Animado',
      screen: const CuadradoAnimadoScreen(),
      icon: FontAwesomeIcons.peopleCarryBox
    ),
    MenuOption(
      route: GraficasCircularesScreen.routerName,
      name: 'Barra Progreso',
      screen: const GraficasCircularesScreen(),
      icon: FontAwesomeIcons.circleNotch
    ),
    MenuOption(
      route: PinterestScreen.routerName,
      name: 'Pinterest',
      screen: const PinterestScreen(),
      icon: FontAwesomeIcons.pinterest
    ),
    MenuOption(
      route: SliderListScreen.routerName,
      name: 'Slivers',
      screen: const SliderListScreen(),
      icon: FontAwesomeIcons.mobile
    ),
  ];
}
