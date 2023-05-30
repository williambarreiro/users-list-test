import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool enabled;
  const DefaultButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : () {},
        child: Text(title),
      ),
    );
  }
}
