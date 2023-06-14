import 'package:flutter/material.dart';
import 'package:mike_cab/brand_colors.dart';

class TaxiButton extends StatelessWidget {
  const TaxiButton({
    super.key,
    required this.title,
    required this.onPressed, required this.color,
  });

  final Color color;

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontFamily: 'Brand-Bold', color: Colors.white),
          ),
        ),
      ),
    );
  }
}
