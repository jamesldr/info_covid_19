import 'package:flutter/material.dart';

class StatusRow extends StatelessWidget {
  const StatusRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          (value ?? ''),
          style: const TextStyle(),
        )
      ],
    );
  }
}
