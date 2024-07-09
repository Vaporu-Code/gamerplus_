import 'dart:convert';

import 'package:flutter/material.dart';

class Estrategias {
  int id;
  int juegoId;
  String juegoNombre;
  bool seleccionado;
  String nombre;
  String dificultad;
  bool completado;
  String descripcion;
  String imagen;

  Estrategias({
    required this.id,
    required this.juegoId,
    required this.juegoNombre,
    required this.seleccionado,
    required this.nombre,
    required this.dificultad,
    required this.completado,
    required this.descripcion,
    required this.imagen,
  });

  factory Estrategias.fromJson(Map<String, dynamic> json) {
    return Estrategias(
      id: json['id'] ?? 0,
      juegoId: json['juegoId'] ?? 0,
      juegoNombre: json['juegoNombre'] ?? '',
      seleccionado: json['seleccionado'] ?? false,
      nombre: json['nombre'] ?? '',
      dificultad: json['dificultad'] ?? '',
      completado: json['completado'] ?? false,
      descripcion: json['descripcion'] ?? '',
      imagen: json['imagen'] ?? '',
    );
  }

  void cambiarSeleccionado() {
    seleccionado = !seleccionado;
  }

  void cambiarCompletado(){
    completado = !completado;
  }
}
