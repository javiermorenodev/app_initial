import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool secondary;

  const LoadingWidget({
    Key? key,
    this.secondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: secondary ? Colors.white : Theme.of(context).primaryColor,
      ),
    );
  }
}
