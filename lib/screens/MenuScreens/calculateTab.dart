import 'package:flutter/material.dart';

class CalculateTab extends StatefulWidget {
  const CalculateTab({super.key});

  @override
  State<CalculateTab> createState() => _CalculateTabState();
}

class _CalculateTabState extends State<CalculateTab> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("Calculate Tab")],
    );
  }
}
