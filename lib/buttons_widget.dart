import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  final AnimationController? animationController;

  const ButtonsWidget({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
