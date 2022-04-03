import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: PowerButton(),
      ),
    );
  }
}

class PowerButton extends StatefulWidget {
  const PowerButton({
    Key? key,
  }) : super(key: key);

  @override
  State<PowerButton> createState() => _PowerButtonState();
}

class _PowerButtonState extends State<PowerButton> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnabled = !isEnabled;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        child: Center(
          child: Icon(
            Icons.bolt,
            size: 100,
            color: Colors.grey[400],
          ),
        ),
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 2,
              color: Colors.grey[300]!,
              inset: isEnabled ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
