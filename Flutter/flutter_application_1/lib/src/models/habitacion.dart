class Habitaciones{
  List<Habitacion> items = [];
  Habitaciones();
  Habitaciones.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;
    for (var item in jsonList) {
      final habitacion = new Habitacion.fromJsonMap(item);
      items.add(habitacion);
    }
  }
}

class Habitacion{
  int? idRoom;
  String? caracteristicas;
  double? importe;
  String? tipo;
  String? estado;

  Habitacion({
    required this.idRoom,
    required this.caracteristicas,
    required this.importe,
    required this.tipo,
    required this.estado

  });

  Habitacion.fromJsonMap(Map<String, dynamic> json){
    idRoom = json['idRoom'];
    caracteristicas = json['caracteristicas'];
    importe = json['importeNoche'];
    tipo = json['tipo'];
    estado = json['estado'];
  }


  factory Habitacion.fromJson(dynamic json){
    return Habitacion(
      idRoom: json['idRoom'] as int?,
      tipo: json['tipo'] as String,
      caracteristicas: json['caracteristicas'] as String,
      importe: json['importeNoche'] as double,
      estado: json['estado'] as String,
    );
  }
}