//import 'package:disenos_app/models/models.dart';
import 'package:disenos_app/providers/providers.dart';
import 'package:disenos_app/router/app_routes.dart';
import 'package:disenos_app/screens/screens.dart';
import 'package:disenos_app/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
        //ChangeNotifierProvider(create: ( _ ) => SliderModel())
        ChangeNotifierProvider(create: ( _ ) => ThemeChanger(2)),
        ChangeNotifierProvider(create: ( _ ) => LayoutModel()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      //initialRoute: AppRoutes.initialRoute,
      home: OrientationBuilder(
        builder: ( BuildContext context, Orientation orientation) {

          final screenSize = MediaQuery.of(context).size;

          if ( screenSize.width > 500 ) {
            return const LauncherTabletScreen();
          } else {
            return const LauncherScreen();
          }

        },
      ),
    );
  }
}
