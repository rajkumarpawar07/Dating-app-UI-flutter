import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DobScreen extends StatelessWidget {
  const DobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            const Text(
              "What's your date of birth?",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeIn(
              child: TextFormField(
                keyboardType: TextInputType.number,
                // controller: _dateController,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.cake,
                    color: Colors.white,
                  ),
                  // labelText: "What's your date of birth?",
                  hintText: 'DD-MM-YYYY',
                  floatingLabelStyle:
                      TextStyle(fontSize: 22, color: Colors.white),
                  labelStyle: TextStyle(fontSize: 22, color: Colors.white),
                  hintStyle: TextStyle(fontSize: 22, color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),

                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),

                onTap: () {},
              ),
            ),
          ]),
    );
  }
}
