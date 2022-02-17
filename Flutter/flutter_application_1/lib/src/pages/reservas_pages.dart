import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/cliente.dart';
import 'package:flutter_application_1/src/models/habitacion.dart';
import 'package:flutter_application_1/src/models/reserva.dart';

class HomeReservas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Reserva reserva = ModalRoute.of(context)!.settings.arguments as Reserva;
    Cliente cliente = reserva.cliente!;
    Habitacion habitacion = reserva.habitacion!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reservas'),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Divider(),
              _reservas(reserva),
              Divider(),
              _cliente(cliente),
              Divider(),
               _habitacion(habitacion),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reservas(Reserva reserva) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("ID de la Reserva: " + reserva.idReserva.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.left),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Fecha de inicio: " + reserva.fechaIni.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Fecha de finalizacion: " + reserva.fechaFin.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Importe: " + reserva.importe.toString() + "€",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Widget _cliente(Cliente cliente) {
    return Container(
      child: Column(
        children: [
          Divider(),
          Text(
            "CLIENTE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("DNI: " + cliente.dni.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.left),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Nombre: " + cliente.nombre.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Apellido: " + cliente.apellido.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Direccion: " + cliente.direccion.toString() + "€",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Telefono: " + cliente.telefono.toString() + "€",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),
    );
  }


  Widget _habitacion(Habitacion habitacion) {
    return Container(
      child: Column(
        children: [
          Divider(),
          Text(
            "Habitacion",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Número: " + habitacion.idRoom.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.left),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Tipo: " + habitacion.tipo.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Caracteristicas: " + habitacion.caracteristicas.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Importe: " + habitacion.importe.toString() + "€",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Estado: " + habitacion.estado.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
