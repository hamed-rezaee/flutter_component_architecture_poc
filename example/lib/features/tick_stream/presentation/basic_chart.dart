import 'dart:math';

import 'package:flutter/material.dart';

import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

class BasicChart extends StatelessWidget {
  const BasicChart({required this.ticks, super.key});

  final List<TickStreamEntity> ticks;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 48),
        child: CustomPaint(painter: _BasicChartPainter(ticks)),
      );
}

class _BasicChartPainter extends CustomPainter {
  _BasicChartPainter(this.data);

  final List<TickStreamEntity> data;

  @override
  void paint(Canvas canvas, Size size) {
    const int yAxisCount = 5;

    final double width = size.width;
    final double height = size.height;

    double minX = double.infinity;
    double maxX = -double.infinity;
    double minY = double.infinity;
    double maxY = -double.infinity;

    final Paint areaPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Colors.grey.withOpacity(0.3),
          Colors.white.withOpacity(0),
        ],
      ).createShader(Rect.fromLTRB(0, 0, width, height));

    final Paint axisPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    for (final TickStreamEntity entity in data) {
      minX = min(minX, entity.epoch.toDouble());
      maxX = max(maxX, entity.epoch.toDouble());
      minY = min(minY, entity.quote);
      maxY = max(maxY, entity.quote);
    }

    canvas
      ..drawLine(Offset(0, height), Offset(width, height), axisPaint)
      ..drawLine(const Offset(0, 0), Offset(0, height), axisPaint);

    final Path path = Path();
    for (int i = 0; i < data.length; i++) {
      final TickStreamEntity entity = data[i];

      final double x = width * ((entity.epoch - minX) / (maxX - minX));
      final double y = height * (1 - ((entity.quote - minY) / (maxY - minY)));

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final Path areaPath = Path.from(path)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(areaPath, areaPaint);

    final double yLabelInterval = (maxY - minY) / yAxisCount;
    const TextStyle labelStyle = TextStyle(color: Colors.white, fontSize: 10);

    for (int i = 0; i <= yAxisCount; i++) {
      final double labelValue = minY + (yLabelInterval * i);
      final String labelText = labelValue.toStringAsFixed(2);

      final TextSpan labelSpan = TextSpan(
        text: labelText,
        style: labelStyle,
      );

      final TextPainter labelPainter = TextPainter(
        text: labelSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      final double labelX = -labelPainter.width - yAxisCount;
      final double labelY =
          height - (i * (height / yAxisCount)) - (labelPainter.height / 2);

      labelPainter.paint(canvas, Offset(labelX, labelY));
    }
  }

  @override
  bool shouldRepaint(_BasicChartPainter oldDelegate) =>
      oldDelegate.data != data;
}
