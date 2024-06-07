import 'package:flutter/material.dart';
import 'package:flutter_inheritedwidget/page/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const InheritedCounter(
      counter: 100,
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class InheritedCounter extends InheritedWidget {
  const InheritedCounter({
    super.key,
    required this.counter,
    //1
    required super.child,
  });

  final int counter;

  static InheritedCounter of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCounter>()!;

  //2
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
