import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_collection/widget/app_bar/common_app_bar.dart';
import 'package:ui_collection/widget/app_bar/common_app_bar_type.dart';

import '../../../widget/bouncy/bouncy.dart';
import '../../../widget/particle/particle.dart';

class TapPage extends StatefulWidget {
  const TapPage({Key? key}) : super(key: key);

  @override
  State<TapPage> createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late Timer timer;

  final List<Color> colors = [
    const Color(0xffffc100),
    const Color.fromARGB(255, 123, 59, 234),
    const Color.fromARGB(255, 103, 243, 198),
    const Color.fromARGB(255, 37, 9, 248),
    const Color.fromARGB(255, 232, 53, 220)
  ];

  final GlobalKey _boxKey = GlobalKey();

  final Random random = Random();

  final double gravity = 9.81,
      dragCof = 0.47,
      airDensity = 1.1644,
      fps = 1 / 24;

  Rect boxSize = Rect.zero;

  List<Particle> particles = [];

  dynamic counterText = {
    "count": 1,
    "color": const Color(0xffffc100),
  };

  @override
  void initState() {
    super.initState();
    // AnimationController for initial Burst Animation of Text
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = Tween(
      begin: 1.0,
      end: 2.0,
    ).animate(_animationController);

    // Getting the Initial size of Container as soon as the First Frame Renders
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Size size = _boxKey.currentContext!.size!;
      boxSize = Rect.fromLTRB(0, 0, size.width, size.height);
    });

    // Refreshing State at Rate of 24/Sec
    timer = Timer.periodic(
      Duration(milliseconds: (fps * 1000).floor()),
      _handleFrameBuilder,
    );
  }

  _animationListener() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  void _handleFrameBuilder(dynamic timestamp) {
    for (var pt in particles) {
      double dragForceX =
          -0.5 * airDensity * pow(pt.velocity.x, 2) * dragCof * pt.area;
      double dragForceY =
          -0.5 * airDensity * pow(pt.velocity.y, 2) * dragCof * pt.area;

      dragForceX = dragForceX.isInfinite ? 0.0 : dragForceX;
      dragForceY = dragForceY.isInfinite ? 0.0 : dragForceY;

      // Calculating Acceleration
      double accX = dragForceX / pt.mass;
      double accY = gravity + dragForceY / pt.mass;

      // Calculating Velocity Change
      pt.velocity.x += accX * fps;
      pt.velocity.y += accY * fps;

      // Calculating Position Change
      pt.position.x += pt.velocity.x * fps * 100;
      pt.position.y += pt.velocity.y * fps * 100;

      // Calculating Position and Velocity Changes after Wall Collision
      _handleBoxCollision(pt);
    }

    if (particles.isNotEmpty) {
      setState(() {});
    }
  }

  void _handleBurstParticle() {
    if (particles.length > 200) {
      particles.removeRange(0, 75);
    }

    _animationController.forward();
    _animationController.addListener(_animationListener);

    double colorRandom = random.nextDouble();

    Color color = colors[(colorRandom * colors.length).floor()];
    String previousCount = "${counterText['count']}";
    Color prevColor = counterText['color'];
    counterText['count'] = counterText['count'] + 1;
    counterText['color'] = color;
    int count = random.nextInt(25).clamp(5, 25);

    for (int x = 0; x < count; x++) {
      double randomX = random.nextDouble() * 4.0;
      if (x % 2 == 0) {
        randomX = -randomX;
      }
      double randomY = random.nextDouble() * -7.0;
      Particle p = Particle();
      p.radius = (random.nextDouble() * 10.0).clamp(2.0, 10.0);
      p.color = prevColor;
      p.position = PVector(boxSize.center.dx, boxSize.center.dy);
      p.velocity = PVector(randomX, randomY);
      particles.add(p);
    }

    List<String> numbers = previousCount.split("");
    for (int x = 0; x < numbers.length; x++) {
      double randomX = random.nextDouble();
      if (x % 2 == 0) {
        randomX = -randomX;
      }
      double randomY = random.nextDouble() * -7.0;
      Particle p = Particle();
      p.type = ParticleType.text;
      p.text = numbers[x];
      p.radius = 25;
      p.color = color;
      p.position = PVector(boxSize.center.dx, boxSize.center.dy);
      p.velocity = PVector(randomX * 4.0, randomY);
      particles.add(p);
    }
  }

  void _handleBoxCollision(Particle pt) {
    if (pt.position.x > boxSize.width - pt.radius) {
      pt.velocity.x *= pt.jumpFactor;
      pt.position.x = boxSize.width - pt.radius;
    }

    if (pt.position.y > boxSize.height - pt.radius) {
      pt.velocity.y *= pt.jumpFactor;
      pt.position.y = boxSize.height - pt.radius;
    }

    if (pt.position.x < pt.radius) {
      pt.velocity.x *= pt.jumpFactor;
      pt.position.x = pt.radius;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    _animationController.removeListener(_animationListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        pageTitle: 'Tapdat',
        appBarType: CommonAppBarType.sub,
      ),
      body: Container(
        key: _boxKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Bouncy(
                    duration: const Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: _handleBurstParticle,
                    onLongPress: () {
                      if (particles.isNotEmpty) {
                        particles.clear();
                      }
                    },
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: counterText['color'],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: counterText['color'].withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                              0,
                              3,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${counterText['count']}',
                          textScaleFactor: _animation.value,
                          style: TextStyle(
                            color: counterText['color'],
                            fontWeight: FontWeight.bold,
                            fontSize: 69,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...particles.map((pt) {
              if (pt.type == ParticleType.text) {
                return Positioned(
                  top: pt.position.y,
                  left: pt.position.x,
                  child: Text(
                    pt.text,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: pt.color),
                  ),
                );
              } else {
                return Positioned(
                  top: pt.position.y,
                  left: pt.position.x,
                  child: Container(
                    width: pt.radius * 2,
                    height: pt.radius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pt.color,
                    ),
                  ),
                );
              }
            }).toList(),
          ],
        ),
      ),
    );
  }
}
