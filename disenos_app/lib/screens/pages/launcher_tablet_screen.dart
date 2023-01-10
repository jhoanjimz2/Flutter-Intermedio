 import 'package:disenos_app/labs/slideshow_screen.dart';
import 'package:disenos_app/providers/providers.dart';
import 'package:disenos_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class LauncherTabletScreen extends StatelessWidget {
  static const String routerName = 'launcher';
  const LauncherTabletScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Tablet'),
        backgroundColor: themeChanger.currentTheme.colorScheme.secondary,
      ),
      drawer: _MenuPrincipal(),
      //body: _ListasOpciones(),
      body: Row(
        children: [

          Container(
            width: 300,
            height: double.infinity,
            child: _ListasOpciones(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: ( themeChanger.darkTheme ) ? Colors.grey : themeChanger.currentTheme.colorScheme.secondary,
          ),
          Expanded(
            child: layoutModel.currentPage
          )

        ]
      ),
    );
  }
}

class _ListasOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final menuOptions = AppRoutes.menuOptions;
    final themeChanger = Provider.of<ThemeChanger>(context).currentTheme;
    final layoutModel = Provider.of<LayoutModel>(context);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: ( context, i ) => Divider(
        color: themeChanger.primaryColorLight,
      ), 
      itemCount: menuOptions.length ,
      itemBuilder: ( context, i ) => ListTile(
        leading: FaIcon( menuOptions[i].icon, color: themeChanger.colorScheme.secondary ),
        title: Text(AppRoutes.menuOptions[i].name),
        trailing: const Icon( Icons.chevron_right ),
        onTap: () {
          layoutModel.currentPage = menuOptions[i].screen;
        },
      ),
    );
  }

}

class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<ThemeChanger>(context);
    final Color secondaryColor = themeChanger.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: const Text('JJ', style: TextStyle( fontSize: 50 )),
                ),
              ),
            ),
            Expanded(
              child: _ListasOpciones(),
            ),
            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: secondaryColor ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: themeChanger.darkTheme,
                activeColor: secondaryColor,
                onChanged: ( value ) => themeChanger.darkTheme = value
              ),
            ),
            SafeArea(
              top: false,
              right: false,
              left: false,
              bottom: true,
              child: ListTile(
                leading: Icon( Icons.add_to_home_screen, color: secondaryColor ),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: themeChanger.customTheme, 
                  activeColor: themeChanger.currentTheme.colorScheme.secondary,
                  onChanged: ( value ) => themeChanger.customTheme = value
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}