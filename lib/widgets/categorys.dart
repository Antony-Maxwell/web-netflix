import 'package:flutter/material.dart';
import 'package:web_netflix/constants/constants.dart';
import 'package:web_netflix/model/movie_model.dart';
import 'package:web_netflix/widgets/main_card.dart';
import 'package:web_netflix/widgets/main_title.dart';

class Categorys extends StatelessWidget {
  const Categorys({
    super.key,required this.title, required this.movieModel
  });
  final String title;
  final  List<MovieModel> movieModel;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight20,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(movieModel.length, (index) => MainCard(image: movieModel[index].posterPath))),
        ),
      ],
    );
  }
}
