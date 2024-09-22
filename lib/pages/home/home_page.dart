import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/widgets/movies_horizontal_list.dart';
import 'package:movie_app/pages/home/widgets/nowplaying_list.dart';
import 'package:movie_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();

  late Future<Result> popular;
  late Future<Result> nowPlaying;
  late Future<Result> upcomingFuture;

  @override
  void initState() {
    popular = apiServices.getPopularMovies();
    nowPlaying = apiServices.getNowPlayingMovies();
    upcomingFuture = apiServices.getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmeflix'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Estão assistindo: ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 244, 244, 244),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
              FutureBuilder<Result>(
                future: nowPlaying,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NowPlayingList(result: snapshot.data!);
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Mais assistidos na ultima semana',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
              FutureBuilder<Result>(
                future: popular,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MoviesHorizontalList(result: snapshot.data!);
                  }
                  return const SizedBox();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Chegando agora!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
              FutureBuilder<Result>(
                future: upcomingFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MoviesHorizontalList(result: snapshot.data!);
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
