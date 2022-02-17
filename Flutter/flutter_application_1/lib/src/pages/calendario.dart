import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/reserva.dart';
import 'package:flutter_application_1/src/providers/reservas_providers.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  TextEditingController _inputFieldDateController = new TextEditingController();
  String _fecha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todas las reservas"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: Icon(Icons.date_range_outlined), onPressed: () {})
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Divider(),
                _crearFecha(context),
                Divider(),
                _crearReservas()
              ],
            ),
          )),
    );
  }

  Widget _crearReservas() {
    final reservasProvider = ReservasProvider();

    return FutureBuilder(
        future: reservasProvider.getReservasPorFechaIni(_fecha),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return _listaReservas(snapshot.data!);
          } else {
            return const Center();
          }
        });
  }

  Widget _listaReservas(List<dynamic> reservas) {
    if (_asignarFecha()) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: reservas.length,
        itemBuilder: (BuildContext context, int index) {
          final codReserva = reservas[index].idReserva;
          final fechaInicio = reservas[index].fechaIni;
          final fechaFin = reservas[index].fechaFin;
          final importe = reservas[index].importe;
          final dniCliente = reservas[index].dniCliente;
          final cliente = reservas[index].cliente;
          final habitacion = reservas[index].habitacion;

          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 70,
            child: 
            GestureDetector(
                  onTap: () async => Navigator.pushNamed( context, 'detalles',
                      arguments: reservas[index]),
              child: Card(
              shadowColor: Colors.black45,
              color: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                    children: [
                      Text(
                        "DNI Cliente: " +
                            dniCliente.toString() + 
                            "                  Importe: " +
                            importe.toString() +
                            "€",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Habitacion: " + habitacion!.idRoom.toString(),
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          hintText: 'Fecha de inicio de la reserva.',
          labelText: 'Fecha de inicio de la reserva.',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        print(_fecha);
        _inputFieldDateController.text = _fecha;
        _crearReservas();
      });
    }
  }

  bool _asignarFecha() {
    bool comp = false;
    if (_fecha != null) {
      comp = true;
    } else {
      comp = false;
    }
    return comp;
  }
}
