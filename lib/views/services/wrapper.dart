import 'package:ada_cbt/views/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            OrientationBuilder(
                builder: (context, Orientation orientation) {
                  return const Splash();
                }
            )
    );
  }
}
