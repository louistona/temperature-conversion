# Temperature Conversion App

## Overview

This **Temperature Conversion App** allows users to convert temperatures between Fahrenheit and Celsius. Users can select the conversion type, enter a temperature value, and view the converted temperature rounded to two decimal places. Additionally, a history of past conversions is displayed within the app.

## Features

- Convert between **Fahrenheit** and **Celsius**.
- User-friendly interface with a simple input form for temperature conversion.
- **History log** displaying past conversions.
- Consistent design in both **portrait** and **landscape** orientations.
- Accurate conversions displayed to **one decimal place**.
- Input validation ensures that only valid numbers are processed.

## Conversion Formulas

The app uses the following formulas for conversion:

- **Celsius to Fahrenheit**:
  \[
  °F = (°C \times \frac{9}{5}) + 32
  \]

- **Fahrenheit to Celsius**:
  \[
  °C = (°F - 32) \times \frac{5}{9}
  \]

## How It Works

1. **Conversion Selection**: The user selects the conversion type (Fahrenheit-to-Celsius or Celsius-to-Fahrenheit).
2. **User Input**: The user enters the temperature value in the provided input field.
3. **Conversion**: The user clicks the "Convert" button to display the converted temperature. The result is displayed with two decimal precision.
4. **History Log**: Each conversion is saved to the history log for reference. For example:
   - F to C: 55.0 => 12.8
   - C to F: 3.5 => 38.3

## Widgets Used

- **Radio Buttons**: To select between Fahrenheit-to-Celsius and Celsius-to-Fahrenheit conversions.
- **TextField**: For user input of the initial temperature.
- **Button**: To trigger the conversion.
- **Text Widget**: To display the result of the conversion.
- **ScrollView**: To display the history of conversions.
- **SnackBar**: To display error messages in case of invalid input.

## Installation & Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/louistona/temperature-conversion.git
   ```
2. Navigate to the project directory:
   ```bash
   cd temperature-conversion
   ```
3. Run the project on an emulator or physical device:

   - For **Flutter**:
     ```bash
     flutter run
     ```

## Demo Video

You can find a demo of this app in action at the following link:
[Demo Video](https://youtu.be/j_ySj78GW8c)
