import 'package:flutter/material.dart';
import 'package:watchlisttask/app/core/app_string.dart';
import 'package:watchlisttask/app/core/app_style.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _searchController,
            cursorColor: Colors.white,
            onChanged: (text) {
              setState(() {
                _isTyping = text.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              labelText: _isTyping ? null : "Enter text here...",
              labelStyle: TextStyle(color: Colors.white54),
              prefixIcon: Icon(Icons.search, color: Colors.white54),
              suffixIcon: _isTyping
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.white54),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _isTyping = false;
                        });
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(AppString.stillindevelopment, style: headLine1),
          ],
        ),
      ),
    );
  }
}
