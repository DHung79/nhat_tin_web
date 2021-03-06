import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _colorList(context),
    );
  }

  Widget _colorList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SelectableText(
          'ERROR: 404\n\n\nPAGE NOT FOUND!',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
