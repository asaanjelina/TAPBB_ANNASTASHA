import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(double) onFontSizeChanged;
  final double currentFontSize;

  SettingsScreen(
      {required this.onFontSizeChanged, required this.currentFontSize});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late double _fontSize;

  @override
  void initState() {
    super.initState();
    _fontSize = widget
        .currentFontSize; // Menginisialisasi font size dengan nilai yang diterima
  }

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
              value: _fontSize,
              min: 10.0,
              max: 30.0,
              onChanged: (value) {
                setState(() {
                  _fontSize =
                      value; // Memperbarui nilai font size saat slider digeser
                });
                widget.onFontSizeChanged(
                    value); // Menyampaikan perubahan font size ke parent
              },
            ),
            Text(
              'Font Size: ${_fontSize.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
