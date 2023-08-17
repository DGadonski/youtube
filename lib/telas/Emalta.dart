// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class Emalta extends StatefulWidget {
  const Emalta({super.key});

  @override
  State<Emalta> createState() => _EmaltaState();
}

class _EmaltaState extends State<Emalta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Em alta'),
      ),
    );
  }
}