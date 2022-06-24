import 'package:flutter/material.dart';

// Not Exactly a Vector, Just to keep the x and y values
class PVector {
  double x, y;

  PVector(this.x, this.y);
}

enum ParticleType { text, circle }

class Particle {
  ParticleType type = ParticleType.circle;
  String text = "";
  PVector position = PVector(0.0, 0.0);
  PVector velocity = PVector(0.0, 0.0);
  double mass = 10.0; //Kg
  double radius = 10 / 100; // 1m = 100 pt or px
  double area = 0.0314; //PI x R x R;
  double jumpFactor = -0.6;
  Color color = Colors.green;
}
