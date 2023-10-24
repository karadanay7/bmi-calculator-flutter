
import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colorReusableCard, required this.cardChild});
  final Color colorReusableCard;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorReusableCard,
      ),
      child: cardChild,
    );
  }
}
