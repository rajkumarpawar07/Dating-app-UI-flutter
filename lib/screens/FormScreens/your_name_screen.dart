import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourNameScreen extends StatelessWidget {
  const YourNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            const Text(
              "What's your name?",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                floatingLabelStyle:
                    TextStyle(fontSize: 22, color: Colors.black),
                labelStyle: TextStyle(fontSize: 22, color: Colors.black),
                hintText: 'First name',
                hintStyle: TextStyle(fontSize: 22, color: Colors.black54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                floatingLabelStyle:
                    TextStyle(fontSize: 22, color: Colors.black),
                labelStyle: TextStyle(fontSize: 22, color: Colors.black),
                hintText: 'Last name',
                hintStyle: TextStyle(fontSize: 22, color: Colors.black54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              "This will display on your profile, and only shared with matches.",
              style: TextStyle(color: Colors.black54),
            ),
            // Other form fields can be added here
          ],
        ),
      ),
    );
  }
}
