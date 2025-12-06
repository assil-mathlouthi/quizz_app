import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryLogo extends StatelessWidget {
  const CategoryLogo({super.key, required this.image, required this.color});
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: SvgPicture.asset(image),
    );
  }
}
