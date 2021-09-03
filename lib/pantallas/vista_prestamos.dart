import 'package:biblioteca_temuco/pantallas/vista_biblioteca.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_temuco/componentes/tarjeta_prestamo.dart' as tarjeta;

class Vista_prestamo extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Libros conseguidos'),
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Colors.green,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Prestamos Actual",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Tab(
                child: Text(
                  "Historial Prestamos",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            tarjeta.Prestamo(
              imagenUri: "lib/assets/Biblioteca_Temuco.jpg",
              fechaSolicitud: "10/06/2021",
              fechaDevolucion: "17/06/2021",
              cantidad: 3,
            ),
            tarjeta.Prestamo(
              imagenUri: "lib/assets/Biblioteca_Temuco.jpg",
              fechaSolicitud: "10/06/2021",
              fechaDevolucion: "17/06/2021",
              cantidad: 10,
            )
          ],
        ),
      ),
    );
  }
}
