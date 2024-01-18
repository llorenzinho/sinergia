import "package:flutter/material.dart";

class Test extends StatelessWidget {
  const Test({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(city),
        ),
        body: Center(
          child: Text(city),
        ));
  }
}
