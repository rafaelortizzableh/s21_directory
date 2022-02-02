import 'dart:convert';

class HealthProviderRemoteEntity {
  final String nombre;
  final String directory;
  final String modulo;
  final String telefono;
  final String especialidad;
  final String subespecialidad;
  final String procedimientos;
  final String edificio;
  final String picture;
  final String directorio;
  final String piso;
  final String consultorio;
  final String busqueda;

  HealthProviderRemoteEntity({
    required this.nombre,
    required this.directory,
    required this.modulo,
    required this.telefono,
    required this.especialidad,
    required this.subespecialidad,
    required this.procedimientos,
    required this.edificio,
    required this.picture,
    required this.directorio,
    required this.piso,
    required this.consultorio,
    required this.busqueda,
  });

  HealthProviderRemoteEntity copyWith({
    String? nombre,
    String? directory,
    String? modulo,
    String? telefono,
    String? especialidad,
    String? subespecialidad,
    String? procedimientos,
    String? edificio,
    String? picture,
    String? directorio,
    String? piso,
    String? consultorio,
    String? busqueda,
  }) {
    return HealthProviderRemoteEntity(
      nombre: nombre ?? this.nombre,
      directory: directory ?? this.directory,
      modulo: modulo ?? this.modulo,
      telefono: telefono ?? this.telefono,
      especialidad: especialidad ?? this.especialidad,
      subespecialidad: subespecialidad ?? this.subespecialidad,
      procedimientos: procedimientos ?? this.procedimientos,
      edificio: edificio ?? this.edificio,
      picture: picture ?? this.picture,
      directorio: directorio ?? this.directorio,
      piso: piso ?? this.piso,
      consultorio: consultorio ?? this.consultorio,
      busqueda: busqueda ?? this.busqueda,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'directory': directory,
      'modulo': modulo,
      'telefono': telefono,
      'especialidad': especialidad,
      'subespecialidad': subespecialidad,
      'procedimientos': procedimientos,
      'edificio': edificio,
      'picture': picture,
      'directorio': directorio,
      'piso': piso,
      'consultorio': consultorio,
      'busqueda': busqueda,
    };
  }

  factory HealthProviderRemoteEntity.fromMap(Map<String, dynamic> map) {
    return HealthProviderRemoteEntity(
      nombre: map['nombre'] ?? '',
      directory: map['directory'] ?? '',
      modulo: map['modulo'] ?? '',
      telefono: map['telefono'] ?? '',
      especialidad: map['especialidad'] ?? '',
      subespecialidad: map['subespecialidad'] ?? '',
      procedimientos: map['procedimientos'] ?? '',
      edificio: map['edificio'] ?? '',
      picture: map['picture'] ?? '',
      directorio: map['directorio'] ?? '',
      piso: map['piso'] ?? '',
      consultorio: map['consultorio'] ?? '',
      busqueda: map['busqueda'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthProviderRemoteEntity.fromJson(String source) =>
      HealthProviderRemoteEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HealthProviderRemoteEntity(nombre: $nombre, directory: $directory, modulo: $modulo, telefono: $telefono, especialidad: $especialidad, subespecialidad: $subespecialidad, procedimientos: $procedimientos, edificio: $edificio, picture: $picture, directorio: $directorio, piso: $piso, consultorio: $consultorio, busqueda: $busqueda)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HealthProviderRemoteEntity &&
        other.nombre == nombre &&
        other.directory == directory &&
        other.modulo == modulo &&
        other.telefono == telefono &&
        other.especialidad == especialidad &&
        other.subespecialidad == subespecialidad &&
        other.procedimientos == procedimientos &&
        other.edificio == edificio &&
        other.picture == picture &&
        other.directorio == directorio &&
        other.piso == piso &&
        other.consultorio == consultorio &&
        other.busqueda == busqueda;
  }

  @override
  int get hashCode {
    return nombre.hashCode ^
        directory.hashCode ^
        modulo.hashCode ^
        telefono.hashCode ^
        especialidad.hashCode ^
        subespecialidad.hashCode ^
        procedimientos.hashCode ^
        edificio.hashCode ^
        picture.hashCode ^
        directorio.hashCode ^
        piso.hashCode ^
        consultorio.hashCode ^
        busqueda.hashCode;
  }
}
