import 'package:flutter/material.dart';
import 'package:biblioteca_temuco/componentes/Boton.dart' as boton;

class Vista_catalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 60.0),
        buscador(),
        SizedBox(height: 40.0),
        catalogo_libro()
      ],
    );
  }
}

Widget buscador() {
  return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Buscar',
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          height: 5,
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 290,
                height: 60,
                child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Ingresar nombre libro',
                        icon: Icon(Icons.search))),
              )),
        ),
      ]));
}

Widget catalogo_libro() {
  List<Widget> categoria_libros = [
    new boton.Muestra(titulo: "Novela", color: Colors.orange),
    new boton.Muestra(titulo: "Historia", color: Colors.red[600]),
    new boton.Muestra(titulo: "Ciencia", color: Colors.green[600]),
    new boton.Muestra(titulo: "Comics", color: Colors.deepOrange[900]),
    new boton.Muestra(titulo: "Revistas", color: Colors.purple[900]),
    new boton.Muestra(titulo: "Deporte", color: Colors.blue[700])
  ];
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        child: Text(
          "Catálogo libros",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      Container(
          height: 350,
          color: Colors.black,
          //GRID COUNT NOS PERMITE CREAR UN MENU CON FILAS Y COLUMNAS.
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 6 / 3,
            children: categoria_libros,
          ))
    ],
  );
}
