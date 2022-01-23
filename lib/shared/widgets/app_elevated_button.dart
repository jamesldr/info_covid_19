import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          backgroundColor: onPressed != null
              ? MaterialStateProperty.all(Colors.black)
              : MaterialStateProperty.all(Colors.grey),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
