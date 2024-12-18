import 'package:flutter/material.dart';

part 'home_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold(drivingInfo: SizedBox(), button: SizedBox());
  }
}
