double convertTemperature(double inputTemperature, bool isFToC) {
  if (isFToC) {
    // Convert Fahrenheit to Celsius in case of Celsius to Fahrenheit: °C = (°F - 32) × 5/9
    return (inputTemperature - 32) * (5 / 9);
  } else {
    // Convert Celsius to Fahrenheit in case of Fahrenheit to Celsius: °F = (°C × 9/5) + 32
    return (inputTemperature * (9 / 5)) + 32;
  }
}
