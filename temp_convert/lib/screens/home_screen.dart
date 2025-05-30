import 'package:flutter/material.dart';
import '../backup/result_history.dart';
import '../operation/convert.dart';
import 'unit_selector_section.dart';
import 'operation_section.dart';
import 'history_section.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  final TextEditingController _inputController = TextEditingController();

  // Tracks the current conversion direction (F→C or C→F)
  bool _isFahrToCels = true;

  // Stores the most recent conversion result
  double? _convertedValue;

  // Maintains the history of all conversions
  List<ResultHistory> _resultHistory = [];

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _handleConversion() {
    // Validate empty input
    if (_inputController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a temperature value')),
      );
      return;
    }

    // Validate numeric input
    final inputValue = double.tryParse(_inputController.text);
    if (inputValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
      return;
    }

    // Perform conversion and update history
    final convertedValue = convertTemperature(inputValue, _isFahrToCels);
    final historyEntry = ResultHistory(
      temperatureType: _isFahrToCels ? 'F to C' : 'C to F',
      inputTemperature: inputValue,
      outputTemperature: convertedValue,
    );

    setState(() {
      _convertedValue = convertedValue;
      _resultHistory.insert(0, historyEntry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Converter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.black, Colors.white],
          ),
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return _buildPortraitLayout();
            } else {
              return _buildLandscapeLayout();
            }
          },
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ConversionSelector(
                    isFahrenheitToCelsius: _isFahrToCels,
                    onChanged: (value) {
                      setState(() {
                        _isFahrToCels = value;
                        _convertedValue = null;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  OperationSection(
                    inputController: _inputController,
                    convertedValue: _convertedValue,
                    onInputChanged: () {
                      if (_convertedValue != null) {
                        setState(() {
                          _convertedValue = null;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleConversion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text(
                        'CONVERT',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConversionHistorySection(history: _resultHistory),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConversionSelector(
                        isFahrenheitToCelsius: _isFahrToCels,
                        onChanged: (value) {
                          setState(() {
                            _isFahrToCels = value;
                            _convertedValue = null;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      OperationSection(
                        inputController: _inputController,
                        convertedValue: _convertedValue,
                        onInputChanged: () {
                          if (_convertedValue != null) {
                            setState(() {
                              _convertedValue = null;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleConversion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text(
                            'CONVERT',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times New Roman",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConversionHistorySection(history: _resultHistory),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
