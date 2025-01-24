import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonCachedImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;

  const CommonCachedImage({
    Key? key,
    required this.imageUrl,
    this.height = 100,
    this.width = 100,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            height: height,
            width: width,
            color: Colors.grey.shade300,
            child: Icon(
              Icons.image,
              color: Colors.grey.shade600,
              size: height * 0.5,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            height: height,
            width: width,
            color: Colors.grey.shade300,
            child: Icon(
              Icons.broken_image,
              color: Colors.grey.shade600,
              size: height * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
