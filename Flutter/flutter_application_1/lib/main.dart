import 'package:flutter/material.dart';

import 'src/pages/calendario.dart';
import 'src/pages/reservas_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Damhotel',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => Calendario(),
          'detalles': (BuildContext context) => HomeReservas(),
          //'actores_detalle': (BuildContext context) => ActoresDetalle()
        });
  }
}