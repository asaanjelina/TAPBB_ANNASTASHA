import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final Function(double) onFontSizeChanged;
  final double currentFontSize;

  SettingsScreen(
      {required this.onFontSizeChanged, required this.currentFontSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Adjust Font Size',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: currentFontSize,
              min: 10.0,
              max: 30.0,
              onChanged: (value) {
                onFontSizeChanged(value);
              },
            ),
            Text(
              'Font Size: ${currentFontSize.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
