import 'package:flutter/material.dart';

class Prestamo extends StatelessWidget {
  final String fechaSolicitud;
  final String fechaDevolucion;
  final String imagenUri;
  final int cantidad;
  const Prestamo({
    Key key,
    @required this.imagenUri,
    @required this.fechaSolicitud,
    @required this.fechaDevolucion,
    @required this.cantidad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cantidad,
        itemBuilder: (context, index) {
          return listaTarjetas();
        });
  }

  Widget listaTarjetas() {
    return Card(
      color: Colors.blue[200],
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              this.imagenUri,
              height: 50,
            ),
          ),
          Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200,
                    height: 120,
                    color: Colors.red,
                    child: Column(
                      children: [
                        Divider(),
                        Text(
                          "Fecha solicitud: " + this.fechaSolicitud,
                          style: TextStyle(color: Colors.white),
                        ),
                        Divider(),
                        Text(
                          "Fecha devolución: " + this.fechaDevolucion,
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber)),
                            onPressed: () {
                              print("FUNCIONA NUESTRO BOTON");
                            },
                            child: Text(
                              "Renovar prestamo",
                            ))
                      ],
                    ),
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
