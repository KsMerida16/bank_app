import 'package:bank_app/assets.dart';
import 'package:flutter/material.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    super.key,
    required this.color,
    required this.imageAsset,
  });

  final Color color;
  final String imageAsset;

  factory SocialWidget.google() {
    return const SocialWidget(color: Colors.red, imageAsset: Assets.googleIcon);
  }

  factory SocialWidget.apple() {
    return const SocialWidget(
      color: Colors.black,
      imageAsset: Assets.appleIcon,
    );
  }

  factory SocialWidget.facebook() {
    return const SocialWidget(
      color: Colors.blue,
      imageAsset: Assets.facebookIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(child: Image.asset(imageAsset, width: 12, height: 12)),
    );
  }
}
