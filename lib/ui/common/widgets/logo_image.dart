import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final String url;
  final double size;

  const LogoImage({Key? key, required this.url, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size)),
      child: kIsWeb
          ? Image.network(
              url,
              height: size,
              width: size,
            )
          : CachedNetworkImage(
              imageUrl: url,
              height: size,
              width: size,
              placeholder: (context, url) => Container(
                color: Colors.black26,
                height: size,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
    );
  }
}
