import 'package:flutter/material.dart';
import 'list_screen.dart'; // Import the ListScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add a gradient background color to make it visually appealing
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add a rounded container with a shadow for a more modern look
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Add an icon or an image
                    Icon(
                      Icons.home,
                      size: 60,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 20),
                    // Add some stylized text
                    Text(
                      'Welcome to the Home Screen!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Add a description text with a different style
                    Text(
                      'We are glad to have you here. Enjoy your stay!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 40),
                    // Add a stylish button for interaction
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to ListScreen when button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListScreen(
                                fontSize: 20.0), // Pass the fontSize parameter
                          ),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: Colors.blueAccent.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
