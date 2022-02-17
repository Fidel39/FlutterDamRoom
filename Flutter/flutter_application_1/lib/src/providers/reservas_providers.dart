import 'dart:convert';

import 'package:flutter_application_1/src/models/reserva.dart';
import 'package:http/http.dart' as http;

class ReservasProvider {
  final String urlMain = '192.168.1.13:8080';

  Future<List<Reserva>> getReservasPorFechaIni(String fecha) async {
    String partes = fecha.split(" ").first;
    print(partes);
    final String url = '/reservas/fechaIni';
    final Map<String, String> _queryParameters = <String, String>{
      'fechaIni': partes,
    };

    final url1 = Uri.http(urlMain, url, _queryParameters);

    final resp = await http.get(url1);
    final decodedDATA = json.decode(resp.body);

    print(decodedDATA);

    final listReservas = Reservas.fromJsonList(decodedDATA);

    return listReservas.reservas;
  }
}
