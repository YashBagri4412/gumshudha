import 'package:flutter/material.dart';

class StaticFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Found!",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 38,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.54,
              width: MediaQuery.of(context).size.width * 0.70,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "img.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              "MD Samir",
              style: TextStyle(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Location - Mathikere",
              style: TextStyle(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Nearest Police Station -Yesvantpur Police Station",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Parents informed!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
