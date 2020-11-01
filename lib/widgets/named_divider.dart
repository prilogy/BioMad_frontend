import 'package:biomad_frontend/styles/indents.dart';
import 'package:flutter/material.dart';

class NamedDivider extends StatelessWidget {
  final String text;

  NamedDivider(this.text);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Indents.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text.toUpperCase(),
              style: TextStyle(color: theme.canvasColor),
            ),
            Divider(
              color: theme.canvasColor,
            )
          ],
        ),
      ),
    );
  }
}
