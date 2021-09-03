import 'package:biblioteca_temuco/componentes/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@override
Widget build(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Mi perfil'),
        ),
        ListTile(
          title: Text('Perfil'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Cerrar cuenta'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            context.read<AuthenticationService>().signOut();
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
