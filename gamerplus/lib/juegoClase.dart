import 'dart:collection';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Juegos {
  int id;
  String imagen;
  String nombre;
  int anno;
  String genero;
  String descripcion;
  String link;
  double puntuacion;
  String worldRecord;

  Juegos({
    required this.id,
    required this.imagen,
    required this.nombre,
    required this.anno,
    required this.genero,
    required this.descripcion,
    required this.link,
    required this.puntuacion,
    required this.worldRecord,
  });

  factory Juegos.fromJson(Map<String, dynamic> json) {
    return Juegos(
      id: json['id'],
      imagen: json['imagen'],
      nombre: json['nombre'],
      anno: json['anno'],
      genero: json['genero'],
      descripcion: json['descripcion'],
      link: json['link'],
      puntuacion: (json['puntuacion'] as num).toDouble(),
      worldRecord: json['worldRecord'],
    );
  }
}
