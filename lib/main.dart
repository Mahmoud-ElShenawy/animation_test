import 'package:flutter/material.dart';

import 'buttons_widget.dart';

void main() {
  runApp(const MyApp());
  // Hello Boys - It's new edit
 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    animation = Tween<double>(
      begin: 0,
      end: 3,
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.easeInBack,
        reverseCurve: Curves.easeInOutQuart,
      ),
    );

    animationController!.forward();

    // animation = Tween<Offset>(
    //   begin: Offset(0, 0),
    //   end: Offset(0, -2),
    // ).animate(animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: animation!,
              child: Container(
                width: 100,
                height: 100,
                child: Image.network('https://i.stack.imgur.com/ILTQq.png'),
              ),
            ),
            SizedBox(height: 15),
            buttonsWidget(),
            ButtonsWidget(
              animationController: animationController,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            animationController!.repeat(
              period: Duration(milliseconds: 1500),
            );
          },
          child: Text('Move'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            animationController!.reverse();
          },
          child: Text('Back'),
        ),
      ],
    );
  }
}
