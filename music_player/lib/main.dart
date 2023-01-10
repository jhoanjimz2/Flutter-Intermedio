import 'package:music_player/providers/providers.dart';
import 'package:music_player/router/app_routes.dart';
import 'package:music_player/share_preferences/preferences.dart';
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
        ChangeNotifierProvider(create: ( _ ) => AudioPlayerProvider())
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
      title: 'Music Player',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
