import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  final double fontSize;

  ListScreen({required this.fontSize});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<dynamic> quotes = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    try {
      final response =
          await http.get(Uri.parse('https://zenquotes.io/api/quotes'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          quotes = data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load quotes. Please try again later.';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes List')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, size: 50, color: Colors.red),
                      SizedBox(height: 10),
                      Text(
                        errorMessage!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: fetchQuotes,
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    final quote = quotes[index];
                    final String quoteText = quote['q'] ?? 'No quote available';
                    final String author = quote['a'] ?? 'Unknown';

                    return ListTile(
                      title: Text(
                        quoteText,
                        style: TextStyle(fontSize: widget.fontSize),
                      ),
                      subtitle: Text(
                        '- $author',
                        style: TextStyle(fontSize: widget.fontSize * 0.8),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(quote: quotes[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
