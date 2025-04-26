import 'package:flutter/material.dart';
import 'package:web_netflix/constants/constants.dart';
import 'package:web_netflix/widgets/custom_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
            children: [
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(kMainImage)),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyListButton(
                        title: "My List",
                        icon: Icons.add,),
                      // private button vere evideyum access ella
                      _playButton(),
                      MyListButton(icon: Icons.info, title: "Info")
                    ],
                  ),
                ),
              ),
            ],
          );
  }
  
  // extract menthord

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.white, // box color behind icon + text
        foregroundColor: Colors.black, // icon & text color
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      icon: const Icon(Icons.play_arrow, size: 30),
      label: const Text("Play", style: TextStyle(fontSize: 20)),
    );
  }
}
