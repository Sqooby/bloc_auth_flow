import 'package:bloc_auth_flow/auth/auth_service.dart';
import 'package:bloc_auth_flow/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //auth service
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        //logo
        DrawerHeader(
          child: Center(
            child: Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 40,
            ),
          ),
        ),

        //home list tile
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(
            title: Text('H O M E'),
            leading: Icon(Icons.home),
            onTap: () {
              //pop the drawer
              Navigator.pop(context);
            },
          ),
        ),

        // settings list tile
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(
            title: Text('S E T T I N G S'),
            leading: Icon(Icons.settings),
            onTap: () {
              //pop the drawer
              Navigator.pop(context);
              //navigate to settings page

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
            },
          ),
        ),

        //logout list tile
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: ListTile(title: Text('L O G O U T'), leading: Icon(Icons.logout), onTap: logout),
        ),
      ]),
    );
  }
}