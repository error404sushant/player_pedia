import 'package:flutter/material.dart';

class ErrorCard extends StatefulWidget {
  const ErrorCard({super.key});

  @override
  State<ErrorCard> createState() => _ErrorCardState();
}

class _ErrorCardState extends State<ErrorCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error,size: 100,),
            SizedBox(height: 20.0),
            Text(
              "An error occurred. Please try again later",
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}