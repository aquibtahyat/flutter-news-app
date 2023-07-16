import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: 250,
            height: 250,
            child: Image.asset('assets/logo/news_logo.jpeg'),
          ),
          SizedBox(
            width: 250,
            height: 250,
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[300]!,
              baseColor: Colors.transparent,
              child: Image.asset('assets/logo/news_logo.jpeg'),
            ),
          ),
        ],
      ),
    );
  }
}
