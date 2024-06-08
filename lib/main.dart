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
    return const MyCounter(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class _InheritedCounter extends InheritedWidget {
  const _InheritedCounter({
    required this.data,
    required super.child,
  });
  final MyCounterState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class MyCounter extends StatefulWidget {
  const MyCounter({
    super.key,
    required this.child,
  });

  final Widget child;

  static MyCounterState of(BuildContext context, {bool rebuild = true}) {
    return rebuild
        ? context.dependOnInheritedWidgetOfExactType<_InheritedCounter>()!.data
        : (context
                .getElementForInheritedWidgetOfExactType<_InheritedCounter>()!
                .widget as _InheritedCounter)
            .data;
  }

  @override
  State<MyCounter> createState() => MyCounterState();
}

class MyCounterState extends State<MyCounter> {
  int count = 0;

  void increment() => setState(() {
        count++;
      });
  @override
  Widget build(BuildContext context) {
    return _InheritedCounter(
      data: this,
      child: widget.child,
    );
  }
}
