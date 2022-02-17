class Clientes{
  List<Cliente> items = [];
  Clientes();
  Clientes.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final clente = new Cliente.fromJsonMap(item);
      items.add(clente);
      }
  }
}

class Cliente{
  String? dni;
  String? nombre;
  String? apellido;
  String? direccion;
  int? telefono;

  Cliente({
    required this.dni, 
    required this.nombre, 
    required this.apellido, 
    required this.direccion, 
    required this.telefono
  });

  Cliente.fromJsonMap(Map<String, dynamic> json){
    dni = json['dni'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    direccion = json['direccion'];
    telefono = json['telefono'];
  }


  factory Cliente.fromJson(dynamic json){
    return Cliente(
      dni: json['dni'] as String, 
      nombre: json['nombre'] as String, 
      apellido: json['apellido'] as String, 
      direccion: json['direccion'] as String, 
      telefono: json['telefono'] as int
      );


  }
    
}
