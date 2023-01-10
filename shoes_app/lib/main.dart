import 'package:shoes_app/providers/providers.dart';
import 'package:shoes_app/router/app_routes.dart';
import 'package:shoes_app/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
        ChangeNotifierProvider(create: ( _ ) => ZapatoProvider())
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
      title: 'Shoes App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
