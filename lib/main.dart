import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generative Art',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generative Art'),
      ),
      body: CustomPaint(
        painter: DemoPainter(),
        child: const SizedBox(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    for (int i = 0; i < 15; i++) {
      drawSpiral(canvas, size);
    }
  }

  void drawSpiral(Canvas canvas, Size size) {
    var random = Random();
    var paint = Paint()..color = colours[random.nextInt(colours.length)];
    var center = size / 2;

    double distance = 0.0;
    double angle = 0.0;

    double distanceDelta = 2 + (random.nextInt(100)/100);
    double angleDelta = 0.2;

    int totalPoints = 300;
    int curr = 0;

    while (curr < totalPoints) {
      // <-- make changes in trignometric functions to have different outputs
      var xVal = center.width + (distance * cos(angle) * sin(angle)); 
      var yVal = center.height + (distance * cos(angle));

      canvas.drawCircle(
          Offset(xVal, yVal), 1.0 + (random.nextInt(150) / 40), paint);
      angle += angleDelta;
      distance += distanceDelta;
      curr++;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// COLORS ==========================
List<Color> colours = [
  Colors.blue,
  Colors.amber,
  Colors.black,
  Colors.red,
  Colors.purple,
  Colors.lightGreenAccent,
  Colors.pink.shade200,
  Colors.green,
  Colors.cyan,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent,
];
