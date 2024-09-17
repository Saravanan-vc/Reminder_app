import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provide.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Provider.of<Provide>(context, listen: false).vlaa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<Provide>(
            builder: (context, value, child) => const Text('')),
      ),
      body: Container(),
    );
  }
}
