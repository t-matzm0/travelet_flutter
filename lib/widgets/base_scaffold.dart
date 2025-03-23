// lib/widgets/base_scaffold.dart
import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';
import '../helpers/responsive_layout.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = ResponsiveLayout.maxContentWidth(context);

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      floatingActionButton: floatingActionButton,
      body: Center(
        child: Container(
          width: maxWidth,
          padding: const EdgeInsets.all(SpotStyles.defaultPadding),
          child: child,
        ),
      ),
    );
  }
}
