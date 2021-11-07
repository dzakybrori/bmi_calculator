import 'package:flutter/material.dart';

import './extensions.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('BMI CALCULATOR')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: CustomCard()),
                Expanded(child: CustomCard()),
              ],
            ),
          ),
          Expanded(child: CustomCard()),
          Expanded(
            child: Row(
              children: [
                Expanded(child: CustomCard()),
                Expanded(child: CustomCard()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const CustomCard({
    Key? key,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.dp(14)),
      decoration: BoxDecoration(
          color: color ?? context.background,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
