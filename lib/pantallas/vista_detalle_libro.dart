import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:biblioteca_temuco/componentes/ScreenArguments.dart'
    as ScreenArguments;

class Vista_detalle_libro extends StatelessWidget {
  Widget build(BuildContext context) {
    final ScreenArguments.Screen librosArgumentos =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(librosArgumentos.titulo),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 230,
              width: 360,
              color: Colors.black,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 200,
                      width: 150,
                      color: Colors.black,
                      child: Image.network(
                        librosArgumentos.UriImage,
                        height: 120,
                      ),
                    ),
                  )),
            ),
            Container(
              alignment: Alignment.center,
              height: 90,
              width: 360,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    height: 90,
                    width: 220,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "N° Id:  24356757657",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          height: 6,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Autor:  " + librosArgumentos.autor,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          height: 6,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Páginas:  448",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          height: 6,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Año:  1995",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 220,
              width: 360,
              color: Colors.black,
              child: Column(
                children: [
                  Text("Resumen",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Divider(
                    height: 6,
                  ),
                  Container(
                    height: 140,
                    width: 310,
                    color: Colors.white,
                    child: Text(librosArgumentos.descripcion,
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Solicitar préstamo"),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
