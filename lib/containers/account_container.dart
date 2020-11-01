import 'package:biomad_frontend/widgets/named_divider.dart';
import 'package:flutter/material.dart';

class AccountContainer extends StatefulWidget {
  @override
  _AccountContainerState createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Ваш аккаунт',
          style: theme.textTheme.headline6
              .merge(TextStyle(color: theme.primaryColor)),
        ),
        NamedDivider('МОИ ПРОФИЛИ')
      ]),
    );
  }
}
