import 'package:biblioteca_temuco/pantallas/vista_listado_libros.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_temuco/componentes/categoriaArguments.dart'
    as categoriaArguments;

class Muestra extends StatelessWidget {
  final String titulo;
  final Color color;

  const Muestra({
    Key key,
    @required this.titulo,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(this.color)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                this.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Vista_listado_novela(),
              settings: RouteSettings(
                  arguments: categoriaArguments.Categoria(
                this.titulo,
              )),
            ));
        print("LA PETICION FUE REALIZADA CON ÉXITO");
      },
    );
  }
}
