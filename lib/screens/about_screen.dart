import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Website'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Welcome to DailyQuotes This app serves as a fun way to keep yourself inspired with daily quotes for motivation, positivity, and good vibes. Stay connected and refreshed with a new quote every day!This App made by Annastasha P.A. NIM 21120122140096 as Final Project for Mobile Development Lab Subject!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                height: 1.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
