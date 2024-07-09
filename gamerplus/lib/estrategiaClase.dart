import 'dart:collection';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class Estrategias {
  int id;
  int juegoId;
  bool seleccionado;
  String nombre;
  String dificultad;
  bool completado;
  String descripcion;
  String imagen;

  Estrategias({
    required this.id,
    required this.juegoId,
    required this.seleccionado,
    required this.nombre,
    required this.dificultad,
    required this.completado,
    required this.descripcion,
    required this.imagen,
  });

  factory Estrategias.fromJson(Map<String, dynamic> json) {
    return Estrategias(
      id: json['id'],
      juegoId: json['juegoId'],
      seleccionado: json['seleccionado'],
      nombre: json['nombre'],
      dificultad: json['dificultad'],
      completado: json['completado'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
    );
  }

  void cambiarSeleccionado(){
    seleccionado =!seleccionado;
  }

}
