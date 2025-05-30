class ResultHistory {
  final double inputTemperature;
  final double outputTemperature;
  final String temperatureType; // 'F to C' or 'C to F'

  ResultHistory({
    required this.inputTemperature,
    required this.outputTemperature,
    required this.temperatureType,
  });

  /// Format the conversion history entry for display
  String get displayText {
    if (temperatureType == 'F to C') {
      return 'F to C: ${inputTemperature.toStringAsFixed(1)} ⇒ ${outputTemperature.toStringAsFixed(1)}';
    } else {
      return 'C to F: ${inputTemperature.toStringAsFixed(1)} ⇒ ${outputTemperature.toStringAsFixed(1)}';
    }
  }
}
