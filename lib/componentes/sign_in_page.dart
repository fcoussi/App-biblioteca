import 'dart:ui';

import 'package:biblioteca_temuco/componentes/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                "lib/assets/logo2.png",
                height: 210,
                width: 210,
              ),
            ),
            Divider(
              height: 20,
            ),
            Container(
              width: 300,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Email",
                ),
              ),
            ),
            Divider(
              height: 15,
            ),
            Container(
              width: 300,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), hintText: 'Password'),
              ),
            ),
            Divider(
              height: 10,
            ),
            Container(
              height: 50,
              width: 260,
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                child: Text("Ingresar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  textStyle: TextStyle(fontSize: 20),
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Vista_ingreso extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              "lib/assets/logo_libro.png",
              height: 250,
              width: 250,
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            width: 300,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Email",
              ),
            ),
          ),
          Divider(
            height: 15,
          ),
          Container(
            width: 300,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration:
                  InputDecoration(icon: Icon(Icons.lock), hintText: 'Password'),
            ),
          ),
          Divider(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: Text("Ingresar"),
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              elevation: 10,
            ),
          )
        ],
      ),
    );
  }
}
/*      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                "lib/assets/logo_libro.png",
                height: 250,
                width: 250,
              ),
            ),
            Divider(
              height: 10,
            ),
            Container(
              width: 300,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Email",
                ),
              ),
            ),
            Divider(
              height: 15,
            ),
            Container(
              width: 300,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), hintText: 'Password'),
              ),
            ),
            Divider(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
              },
              child: Text("Ingresar"),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                elevation: 10,
              ),
            )
          ],
        ),
      ), */