import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:f7apparel_mobile/common/commons.dart';
import 'package:f7apparel_mobile/common/theme/colors.dart';
import 'package:f7apparel_mobile/widgets/asset_icon.dart';
import 'section_card.dart';

class ProgressArc extends CustomPainter {
  final double progress;
  final double arcStrokeWidth;
  final double bgStrokeWidth;
  final Color arcColor;
  final Color backgroundColor;

  ProgressArc({
    required this.progress,
    this.arcStrokeWidth = 5.0,
    this.bgStrokeWidth = 3.0,
    this.arcColor = TDMColors.kOrange,
    this.backgroundColor = TDMColors.grey200,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = arcColor
      ..strokeWidth = arcStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = bgStrokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide - max(arcStrokeWidth, bgStrokeWidth)) / 2;

    // 90 degrees offset for sta      rting at top
    final startAngle = radians(-90);
    // Minus progress to make it counterclockwise
    final sweepAngle = radians(-progress * 360);

    canvas.drawCircle(center, radius, bgPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(ProgressArc oldDelegate) =>
      progress != oldDelegate.progress ||
      arcColor != oldDelegate.arcColor ||
      backgroundColor != oldDelegate.backgroundColor;
}

class _StatisticItem extends StatelessWidget {
  const   _StatisticItem(
      {Key? key,
      required this.title,
      required this.value,
      required this.unit,
      required this.icon,
      required this.color})
      : super(key: key);

  final String title;
  final String value;
  final String unit;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPaint(
          painter: ProgressArc(progress: 0.75, arcColor: color),
          child: SizedBox(
            width: 56,
            height: 56,
            child: Center(
              child: AssetIcon(icon: icon, color: color),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            LoopTextScaleFactor(
              scaleFactor: const ScaleFactor(upperLimit: 1.2),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: TDMColors.grey400,
                ),
              ),
            ) ,

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: value,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  TextSpan(
                    text: unit,
                    style:  TextStyle(
                      fontSize: 16.sp,
                      color: TDMColors.grey400,
                    ),
                  ),
                ],
              ),
              textScaleFactor: 1.0,
            ),




          ],
        ),
      ],
    );
  }
}

class TodayEventCard extends StatelessWidget {
  const TodayEventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SectionCard(
      title: "Today's event",
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                  child: _StatisticItem(
                title: 'Fluid Intake',
                value: '2500',
                unit: 'mill',
                icon: 'fluid-intake',
                color: TDMColors.blue100,
              )),
              Expanded(
                  child: _StatisticItem(
                title: "Activity Time",
                value: '12:30',
                unit: 'h/m',
                icon: 'activity-heart',
                color: TDMColors.kOrange,
              )),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: const [
              Expanded(
                  child: _StatisticItem(
                title: 'Calories',
                value: '2500',
                unit: 'kcal',
                icon: 'diet',
                color: TDMColors.green400,
              )),
              Expanded(
                  child: _StatisticItem(
                title: 'Sleep Duration',
                value: '00:30',
                unit: 'h/m',
                icon: 'sleep',
                color: TDMColors.purple,
              )),
            ],
          ),
        ],
      ),
    );
  }
}




class ScaleFactor {
  ///The [lowerLimit] value of the scale
  final double lowerLimit;

  ///The [upperLimit] value of the scale
  final double upperLimit;

  /// Define a scale factor
  /// The arguments [lowerLimit] and [upperLimit] must form a valid range (from 0.0 to 2.0) where
  /// lowerLimit<=upperLimit.
  const ScaleFactor({
    this.lowerLimit = 0.0,
    this.upperLimit = 2.0,
  })  : assert(lowerLimit >= 0),
        assert(upperLimit <= 2),
        assert(lowerLimit <= upperLimit);

  /// Define a fixed scale factor
  /// The arguments [fixedLimit] must have valid range (from 0.0 to 2.0). Default 1.0
  const ScaleFactor.fixed({
    double fixedLimit = 1.0,
  })  : lowerLimit = fixedLimit,
        upperLimit = fixedLimit,
        assert(fixedLimit >= 0),
        assert(fixedLimit <= 2);

  /// EE default scale factor
  /// where [lowerLimit] will be valued as [1.0] and [upperLimit] to [2.0]
  static const ScaleFactor Default = ScaleFactor(
    lowerLimit: 1.0,
    upperLimit: 2.0,
  );

  @override
  String toString() {
    return 'scaleFactor: {lowerLimit: [$lowerLimit], upperLimit: [$upperLimit]}';
  }
}

class LoopTextScaleFactor extends StatelessWidget {
  /// The child widget where textScaleFactor is activated
  final Widget child;

  /// The ScaleFactor limits to check
  final ScaleFactor scaleFactor;

  ///  Clamp the TextScaleFactor of a MediaQueryData to be to be in the [scaleFactor].
  /// The argument [scaleFactor] must form a valid range
  static double textScaleFactor(
      MediaQueryData mediaQueryData, {
        ScaleFactor? scaleFactor,
      }) {
    final currentLimits = scaleFactor ?? ScaleFactor.Default;

    return mediaQueryData.textScaleFactor.clamp(
      currentLimits.lowerLimit,
      currentLimits.upperLimit,
    );
  }

  /// EETextScaleFactor clamp the textScaleFactor of [child] widget to be to be in the [scaleFactor].
  /// [child] is the child widget where textScaleFactor is activated
  /// [scaleFactor] is the ScaleFactor limits to check. If [null] ScaleFactor.Default will be used instead. See [ScaleFactor] documentation.
  const LoopTextScaleFactor({
    required this.child,
    Key? key,
    ScaleFactor? scaleFactor,
  })  : scaleFactor = scaleFactor ?? ScaleFactor.Default,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.maybeOf(context);

    if (mediaQueryData == null) return child;

    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: textScaleFactor(
          mediaQueryData,
          scaleFactor: scaleFactor,
        ),
      ),
      child: child,
    );
  }
}