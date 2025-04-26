import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:web_netflix/constants/constants.dart';
import 'package:web_netflix/drawer/drawer_ui.dart';
import 'package:web_netflix/model/movie_model.dart';
import 'package:web_netflix/routes/routes_name.dart';
import 'package:web_netflix/services/home_services.dart';
import 'package:web_netflix/widgets/background_card.dart';
import 'package:web_netflix/widgets/categorys.dart';

//appbar visiblity
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MovieModel> movies = [];
  final List<MovieModel> trendingMovies = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData()async{
    await MovieService().fetchMovies().then(
      (value) {
        movies.addAll(value);
      },
    );

    await MovieService().fetchTrending().then(
      (value) {
        trendingMovies.addAll(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerUI(),
      backgroundColor: const Color.fromARGB(255, 1, 13, 24),
      // scroll removing
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          //notifiListeners use cheyithth scroll eth direction anu ennu check cheyan

          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    ///Main Image Sction//
                    BackgroundCard(image: "dndkhvbskhdbvkhsbv",),

                    Categorys(
                      title: "Popular on Netflix",
                      movieModel: movies,
                    ),
                    kHeight,
                    Categorys(
                      title: "Trending Now",
                      movieModel: trendingMovies,
                    ),
                    kHeight,
                    Categorys(
                      title: "Continue Watching",
                      movieModel: movies,
                    ),
                    kHeight,
                    Categorys(
                      title: "Blockbuster Action",
                      movieModel: movies,
                    ),
                  ],
                ),

                // appbar style
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: Duration(microseconds: 100),
                        width: double.infinity,
                        height: 80,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        child: Column(
                          children: [
                            // … inside your AnimatedContainer’s Column:
                            Padding(
                              // adjust left padding if you want the icon closer to the edge
                              padding:
                                  const EdgeInsets.only(left: 16, right: 60),
                              child: Row(
                                children: [
                                  // 1) Drawer icon
                                  Builder(
                                    builder: (ctx) => IconButton(
                                      icon: const Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                      onPressed: () =>
                                          Scaffold.of(ctx).openDrawer(),
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  // 2) Your Netflix logo
                                  Image.network(
                                    "https://cdn-images-1.medium.com/v2/resize:fit:1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      context.goNamed(
                                        RoutesName.search,
                                      ); // Navigate to Settings
                                    },
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Tv Shows",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Movies",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Categories",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}

//extract widget
