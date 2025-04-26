import 'package:flutter/material.dart';
import 'package:web_netflix/constants/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 20),
      child: Container(
        width: 100,
        height: 200,
        decoration: image.isNotEmpty ? BoxDecoration(
          borderRadius: kRadius10,
          image: DecorationImage(
            fit: BoxFit.cover,
            
            image: NetworkImage(
              "https://image.tmdb.org/t/p/w500$image",
            ),
          ),
        ) : BoxDecoration(),
        child: image.isEmpty ? CircularProgressIndicator() : null,
      ),
    );
  }
}
