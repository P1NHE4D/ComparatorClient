import 'dart:ui';

Color determineBarColor(double value, double minVal, double maxVal) {
  value = value ?? 0.0;
  minVal = minVal ?? 0.0;
  maxVal = maxVal ?? 1.0;

  final double distanceFromMax = maxVal - value;
  final double range = maxVal - minVal;
  final double percentage = 1.0 - (distanceFromMax / range);

  final r = percentage > 0.5
      ? 0xe6 - ((percentage - 0.5) * 2.0 * 0xe6).toInt()
      : 0xe6;
  final g = percentage < 0.5
      ? 0xe6 - ((0.5 - percentage) * 2.0 * 0xe6).toInt()
      : 0xe6;

  return Color.fromARGB(0xdd, r, g, 0x0);
}
