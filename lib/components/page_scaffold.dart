import 'package:flutter/material.dart';
import 'package:todo_bloc/core/design_system.dart';

class PageScaffold extends StatelessWidget {
  final PreferredSize appBar;
  final List<Widget> children;
  final GlobalKey? scaffoldKey;

  const PageScaffold({
    Key? key,
    required this.appBar,
    required this.children,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      backgroundColor: DSColors.backgroundBodyGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: children,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
