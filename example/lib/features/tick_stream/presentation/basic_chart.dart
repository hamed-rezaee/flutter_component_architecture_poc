import 'dart:math';

import 'package:flutter/material.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:example/features/tick_stream/presentation/helpers/helpers.dart';

class BasicChart extends StatelessWidget {
  const BasicChart({required this.ticks, Key? key}) : super(key: key);

  final List<TickStreamEntity> ticks;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 48),
        child: CustomPaint(painter: _BasicChartPainter(ticks)),
      );
}

class _BasicChartPainter extends CustomPainter {
  _BasicChartPainter(this.data);

  final List<TickStreamEntity> data;

  @override
  void paint(Canvas canvas, Size size) {
    const int yAxisCount = 5;
    const TextStyle labelStyle = TextStyle(color: Colors.white, fontSize: 10);

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
          Colors.blue.withOpacity(0.4),
          Colors.blue.withOpacity(0),
        ],
      ).createShader(Rect.fromLTRB(0, 0, width, height));

    final Paint pathPaint = Paint()
      ..color = Colors.grey.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Paint currentPointPaint = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    for (final TickStreamEntity entity in data) {
      minX = min(minX, entity.epoch.toDouble());
      maxX = max(maxX, entity.epoch.toDouble());
      minY = min(minY, entity.quote);
      maxY = max(maxY, entity.quote);
    }

    final double yAxisX = width - 1;

    final Paint axisPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    canvas
      ..drawLine(Offset(width, height), Offset(0, height), axisPaint)
      ..drawLine(Offset(width, 0), Offset(width, height), axisPaint);

    final Path path = Path();

    for (int i = 0; i < data.length; i++) {
      final TickStreamEntity entity = data[i];

      final double x =
          width * ((entity.epoch.toDouble() - minX) / (maxX - minX));
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

    canvas
      ..drawPath(areaPath, areaPaint)
      ..drawPath(path, pathPaint);

    final double yLabelInterval = (maxY - minY) / yAxisCount;

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

      final double labelX = yAxisX + labelPainter.width / 4;
      final double labelY =
          height - (i * (height / yAxisCount)) - (labelPainter.height / 2);

      labelPainter.paint(canvas, Offset(labelX, labelY));
    }

    final List<double> xLabels = <double>[];
    final double xLabelInterval = (maxX - minX) / 5;

    for (int i = 0; i < 6; i++) {
      final double labelValue = minX + (xLabelInterval * i);
      xLabels.add(labelValue);
    }

    const TextStyle xLabelStyle = TextStyle(
      color: Colors.white,
      fontSize: 10,
    );

    for (int i = 0; i < xLabels.length; i++) {
      final double labelValue = xLabels[i];
      final String labelText = getFormattedTime(labelValue.toInt());

      final TextSpan labelSpan = TextSpan(
        text: labelText,
        style: xLabelStyle,
      );

      final TextPainter labelPainter = TextPainter(
        text: labelSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      final double labelX = width * ((labelValue - minX) / (maxX - minX));
      final double labelY = height + labelPainter.width / 6;

      canvas
        ..save()
        ..translate(labelX, labelY)
        ..rotate(pi / 8);

      labelPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }

    final double currentValueY =
        height * (1 - ((data.last.quote - minY) / (maxY - minY)));

    final TextStyle valueStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    final TextSpan currentSpan = TextSpan(
      text: data.last.quote.toStringAsFixed(2),
      style: valueStyle,
    );

    final TextPainter currentPainter = TextPainter(
      text: currentSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    const double valuePadding = 4;

    final double currentValueX = width - currentPainter.width - valuePadding;

    currentPainter.paint(
      canvas,
      Offset(currentValueX, currentValueY - currentPainter.height),
    );

    final double currentPointX =
        width * ((data.last.epoch.toDouble() - minX) / (maxX - minX));
    final double currentPointY =
        height * (1 - ((data.last.quote - minY) / (maxY - minY)));

    canvas.drawCircle(
        Offset(currentPointX, currentPointY), 4, currentPointPaint);
  }

  @override
  bool shouldRepaint(_BasicChartPainter oldDelegate) =>
      oldDelegate.data != data;
}
