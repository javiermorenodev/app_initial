import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  final Function? onPressed;
  const ButtomWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(),
      child: Container(
        width: 100.0,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: const Center(
          child: Text(
            'Guardar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
