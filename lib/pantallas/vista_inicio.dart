import 'package:biblioteca_temuco/pantallas/vista_catalogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:biblioteca_temuco/pantallas/vista_biblioteca.dart';
import 'package:biblioteca_temuco/pantallas/vista_prestamos.dart';
import 'package:biblioteca_temuco/componentes/Drawer.dart' as menu;

class InicioPagina extends StatefulWidget {
  @override
  _InicioPaginaState createState() => _InicioPaginaState();
}

//PAGINA PRINCIPAL DE MI RUTA
class _InicioPaginaState extends State<InicioPagina> {
  int _indiceActual = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //SOLUCIONAR ERROR RENDERFLEX OVERFLOWED
      resizeToAvoidBottomInset: false,
      body:
          //EL BODY SE GENERA  EN BASE A VARIABLE IndiceActual, SE ACTUALIZA EN onTabTapped()
          _setbody(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int indice) {
            //En setState actualizo la variable indice, para actualizar mi vista
            setState(() {
              _indiceActual = indice;
            });
          },
          //Indice inicial a mostrar
          currentIndex: _indiceActual,

          //Propiedades BottomNavigationBarItem
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Inicio',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(
                'Buscar',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text(
                'Prestamos',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ]),
    );
  }

  Widget _setbody() {
    if (_indiceActual == 0) {
      return Vista_biblioteca();
    }

    if (_indiceActual == 1) {
      return Vista_catalogo();
    }

    if (_indiceActual == 2) {
      return Vista_prestamo();
    }
  }
}
