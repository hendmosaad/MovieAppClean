import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/AppStrings.dart';
import 'package:movies_app/core/conestances.dart';
import 'package:movies_app/core/dummy.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_bloc.dart';
import 'package:movies_app/movies/persentation/controllers/bloc/movies_states.dart';
import 'package:movies_app/movies/persentation/screens/movie_detail_screen.dart';
class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    print('buildNowPlayingComponent');
    return BlocBuilder<MoviesBloc,MoviesStates>(
      buildWhen: (previous, current)
        {
         return previous.nowPlayStatus!=current.nowPlayStatus;
        },
        builder: (context,state) {
      switch (state.nowPlayStatus)
          {
        case RequestStatus.isLoaded:
          print('nowplayingbuilded');
              return FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {},
                    ),
                    items: state.nowPlayingMovies.map(
                          (item) {
                        return GestureDetector(
                          key: const Key('openMovieMinimalDetail'),
                          onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ( context)=>MovieDetailScreen(id: item.id)));
                          },
                          child: Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // fromLTRB
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    stops: [0, 0.3, 0.5, 1],
                                  ).createShader(
                                    Rect.fromLTRB(0, 0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                  height: 560.0,
                                  imageUrl: AppConexstances.imageUrl(item.backdropPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.redAccent,
                                            size: 16.0,
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            AppStrings.nowPlaying.toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        item.title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
        case RequestStatus.isLoading:
          print('loading');
          return Container(
            height: 400,
            child: Center(
                child: CircularProgressIndicator(),

            ),
          );
        case RequestStatus.error:
          print('error');
          return Container(
            child: Center(
              child: Text('${state.nowPlayingMessege}'),
            ),
          );


      }

    });
  }
}
