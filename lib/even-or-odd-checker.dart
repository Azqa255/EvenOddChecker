import 'package:flutter/material.dart';

void main() {
  runApp(EvenOddApp());
}

class EvenOddApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Even or Odd Checker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
      ),
      home: EvenOddChecker(),
    );
  }
}

class EvenOddChecker extends StatefulWidget {
  @override
  _EvenOddCheckerState createState() => _EvenOddCheckerState();
}

class _EvenOddCheckerState extends State<EvenOddChecker> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _checkEvenOdd() {
    String input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _result = 'Please enter a valid number.';
      });
      return;
    }

    int? number = int.tryParse(input);
    if (number == null) {
      setState(() {
        _result = 'Please enter a valid number.';
      });
    } else if (number % 2 == 0) {
      setState(() {
        _result = 'The number is Even: $number';
      });
    } else {
      setState(() {
        _result = 'The number is Odd: $number';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Even or Odd Checker',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter a number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkEvenOdd,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Check',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
