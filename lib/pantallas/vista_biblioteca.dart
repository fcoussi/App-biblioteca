import 'package:flutter/material.dart';
import 'package:biblioteca_temuco/componentes/Drawer.dart' as menu;

class Vista_biblioteca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("APP BAR"),
        backgroundColor: Colors.black,
      ),
      body: ListView(children: <Widget>[
        Tarjeta(
          imagenUri: 'lib/assets/Biblioteca_Temuco.jpg',
          titulo: 'Aserca la bilioteca',
          descripcion:
              'Sección encargada de mostrar información de horarios, fono y dirección',
        ),
        Tarjeta(
          imagenUri: 'lib/assets/libros_leidos.jpg',
          titulo: 'Nuevos libros',
          descripcion:
              'Sección donde se publicarán los ultimos libros agregados',
        ),
        Tarjeta(
          imagenUri: 'lib/assets/libros-top.jpg',
          titulo: 'Libros Top',
          descripcion: 'Libros más solicitados en la ciudad de Temuco',
        ),
      ]),
      drawer: menu.build(context),
    );
  }
}

class Tarjeta extends StatelessWidget {
  final String imagenUri;
  final String titulo;
  final String descripcion;

  const Tarjeta({
    Key key,
    @required this.imagenUri,
    @required this.titulo,
    @required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.titulo,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(height: 5.0),
          Card(
            shape: ContinuousRectangleBorder(
                side: BorderSide(
              color: Colors.amber,
              width: 0.5,
            )),
            color: Colors.black,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    this.imagenUri,
                    height: 100,
                  ),
                ),
                Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 145,
                          height: 100,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                this.descripcion,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        )),
                  ),
                ]),
              ],
            ),
          ),
        ]));
  }
}
