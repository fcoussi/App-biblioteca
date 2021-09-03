import 'package:firebase_auth/firebase_auth.dart';
import 'package:biblioteca_temuco/componentes/AuthenticationService.dart';
import 'package:biblioteca_temuco/componentes/sign_in_page.dart';
import 'package:biblioteca_temuco/pantallas/vista_biblioteca.dart';
import 'package:biblioteca_temuco/pantallas/vista_detalle_libro.dart';
import 'package:biblioteca_temuco/pantallas/vista_inicio.dart';
import 'package:biblioteca_temuco/pantallas/vista_listado_libros.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Inicializando FlutterFire, antes de usar cualquier servicio de Firebase
//Ejemplo con FutureBuilder
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Inicializando FlutterFire con initializedApp()
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  // Crea el Futuro de inicialización fuera de `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// El futuro es parte del estado de nuestro widget. No deberíamos llamar a `initializeApp`
  /// directamente dentro de [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Inicializar FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Verifica si hay errores
        if (snapshot.hasError) {
          return SignInPage();
        }

        // Una vez completado, muestre su solicitud
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // De lo contrario, muestre algo mientras espera a que se complete la inicialización
        return SignInPage();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          //Creando una nueva instancia de Firebase Auth
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              //Estado de autenticación
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        //Retira la etiqueta bug en la esquina
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(),
        routes: <String, WidgetBuilder>{
          '/sesion': (BuildContext context) => AuthenticationWrapper(),
          '/formulario': (BuildContext context) => SignInPage(),
          '/one': (BuildContext context) => InicioPagina(),
          '/two': (BuildContext context) => Vista_biblioteca(),
          '/Vista_detalle_libro': (BuildContext context) =>
              Vista_detalle_libro(),
          '/vista_listado_novela': (BuildContext context) =>
              Vista_listado_novela(),
        },
        initialRoute: '/sesion',
      ),
    );
  }
}

//CREANDO UN CONTENEDOR DE AUTENTICACIÓN
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return InicioPagina();
    } else {
      return SignInPage();
    }
  }
}
