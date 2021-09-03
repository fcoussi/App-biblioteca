import 'dart:convert';
import 'package:biblioteca_temuco/pantallas/vista_detalle_libro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:biblioteca_temuco/componentes/ScreenArguments.dart'
    as ScreenArguments;
import 'package:biblioteca_temuco/componentes/categoriaArguments.dart'
    as categoriaArguments;

class Vista_listado_novela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriaArguments.Categoria miCategorias =
        ModalRoute.of(context).settings.arguments;

    print("VALOR DE CATEGORIA: " + miCategorias.categoria);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Listado  ' + miCategorias.categoria),
      ),
      body: ListaLibro(miCategorias.categoria),
    );
  }
}

//Creacion clase libro
class Libro {
  String tituloLibro, autor, descripcion, imagenLibro;
  Libro(this.tituloLibro, this.autor, this.descripcion, this.imagenLibro);

  //Obteniendo las variables a partir del json
  Libro.fromJson(Map<String, dynamic> json)
      : tituloLibro = json['titulo'],
        autor = json['Autor'],
        descripcion = json['Descripcion'],
        imagenLibro = json['ImagenUri'];
}

class ListaLibro extends StatefulWidget {
  String titulo;
  ListaLibro(String titulo) {
    this.titulo = titulo;
  }

  @override
  _ListaLibroState createState() => _ListaLibroState(titulo);
}

class _ListaLibroState extends State<ListaLibro> {
  bool cargando;
  List<Libro> libros;
  String titulo;

  _ListaLibroState(titulo) {
    this.titulo = titulo;
  }

  void initState() {
    libros = [];
    cargando = true;

    //Metodo encargado de leer los json
    _cargandoLibros(titulo);

    super.initState();
  }

  void _cargandoLibros(String titulo) async {
    //Obtenemos el contenido del archivo usando loadString
    final respuesta = await rootBundle.loadString('lib/data/libro.json');

    // Usamos json.decode para convertir el contenido a un map
    final miJson = json.decode(respuesta);
    List<Libro> _libros = [];

    //Recorriendo los results desde json, agregandolo a la lista
    for (var jsonLibros in miJson[titulo]) {
      _libros.add(Libro.fromJson(jsonLibros));
    }

    setState(() {
      libros = _libros;
      cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Mostrar círculo de carga
    if (cargando) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Container(
            height: 70,
            color: Colors.black,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Vista_detalle_libro(),
                      settings: RouteSettings(
                        arguments: ScreenArguments.Screen(
                            libros[index].tituloLibro,
                            libros[index].imagenLibro,
                            libros[index].autor,
                            libros[index].descripcion),
                      ),
                    ),
                  );

                  //Navigator.of(context).pushNamed('/Vista_detalle_libro');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: ListTile(
                  title: Text(
                    libros[index].tituloLibro,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  leading: Image.network(
                    libros[index].imagenLibro,
                  ),
                )));
      },

      //SE CONTROLA LA LONGITUD DE LA LISTA
      itemCount: libros.length,
    );
  }
}
