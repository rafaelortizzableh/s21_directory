import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../core/core.dart';
import 'health_provider_remote_entity.dart';

class HealthProvider {
  final String imageUrl;
  final String name;
  final String? speciality;
  final String? subSpeciality;
  final String? building;
  final String? floor;
  final String? consultory;
  final String? module;
  final String? telephonesString;
  final List<String>? telephones;
  final String? proceduresString;
  final List<String>? procedures;
  HealthProvider({
    required this.imageUrl,
    required this.name,
    this.speciality,
    this.subSpeciality,
    this.building,
    this.floor,
    this.consultory,
    this.module,
    this.telephonesString,
    this.telephones,
    this.proceduresString,
    this.procedures,
  });

  HealthProvider copyWith({
    String? imageUrl,
    String? name,
    String? speciality,
    String? subSpeciality,
    String? building,
    String? floor,
    String? consultory,
    String? module,
    String? telephonesString,
    List<String>? telephones,
    String? proceduresString,
    List<String>? procedures,
  }) {
    return HealthProvider(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      speciality: speciality ?? this.speciality,
      subSpeciality: subSpeciality ?? this.subSpeciality,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      consultory: consultory ?? this.consultory,
      module: module ?? this.module,
      telephonesString: telephonesString ?? this.telephonesString,
      telephones: telephones ?? this.telephones,
      proceduresString: proceduresString ?? this.proceduresString,
      procedures: procedures ?? this.procedures,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'speciality': speciality,
      'subSpeciality': subSpeciality,
      'building': building,
      'floor': floor,
      'consultory': consultory,
      'module': module,
      'telephonesString': telephonesString,
      'telephones': telephones,
      'proceduresString': proceduresString,
      'procedures': procedures,
    };
  }

  factory HealthProvider.fromMap(Map<String, dynamic> map) {
    return HealthProvider(
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      speciality: map['speciality'],
      subSpeciality: map['subSpeciality'],
      building: map['building'],
      floor: map['floor'],
      consultory: map['consultory'],
      module: map['module'],
      telephonesString: map['telephonesString'],
      telephones: List<String>.from(map['telephones']),
      proceduresString: map['proceduresString'],
      procedures: List<String>.from(map['procedures']),
    );
  }

  factory HealthProvider.fromRemoteEntity(
    HealthProviderRemoteEntity remoteEntity,
  ) {
    try {
      final telephonesList = _sanitizeStringAndCreateList(
        remoteEntity.telefono,
      );
      final proceduresList = _sanitizeStringAndCreateList(
        remoteEntity.procedimientos,
      );

      return HealthProvider(
        imageUrl: remoteEntity.picture.isNotEmpty
            ? remoteEntity.picture
            : AppConstants.fallBackImageUrl,
        name: remoteEntity.nombre,
        speciality: remoteEntity.especialidad,
        subSpeciality: remoteEntity.subespecialidad,
        building: remoteEntity.edificio,
        floor: remoteEntity.piso,
        consultory: remoteEntity.consultorio,
        module: remoteEntity.modulo,
        telephonesString: remoteEntity.telefono,
        telephones: telephonesList,
        proceduresString: remoteEntity.procedimientos,
        procedures: proceduresList,
      );
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  static List<String> _sanitizeStringAndCreateList(
    String listAsString,
  ) {
    final initialList = !listAsString.contains('<br>')
        ? [listAsString]
        : listAsString.split('<br>');
    final sanitizedList = initialList
        .map((word) => word.replaceAll('<br>', ''))
        .where((element) => element.trim().isNotEmpty)
        .toList();

    return sanitizedList;
  }

  String toJson() => json.encode(toMap());

  factory HealthProvider.fromJson(String source) =>
      HealthProvider.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HealthProvider(imageUrl: $imageUrl, name: $name, speciality: $speciality, subSpeciality: $subSpeciality, building: $building, floor: $floor, consultory: $consultory, module: $module, telephonesString: $telephonesString, telephones: $telephones, proceduresString: $proceduresString, procedures: $procedures)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HealthProvider &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.speciality == speciality &&
        other.subSpeciality == subSpeciality &&
        other.building == building &&
        other.floor == floor &&
        other.consultory == consultory &&
        other.module == module &&
        other.telephonesString == telephonesString &&
        listEquals(other.telephones, telephones) &&
        other.proceduresString == proceduresString &&
        listEquals(other.procedures, procedures);
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        name.hashCode ^
        speciality.hashCode ^
        subSpeciality.hashCode ^
        building.hashCode ^
        floor.hashCode ^
        consultory.hashCode ^
        module.hashCode ^
        telephonesString.hashCode ^
        telephones.hashCode ^
        proceduresString.hashCode ^
        procedures.hashCode;
  }
}
